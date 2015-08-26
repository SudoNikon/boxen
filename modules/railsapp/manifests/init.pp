define railsapp (
  $application_yml = undef,
  $port            = undef,
  $ruby            = '2.1.5',
  $mongodb         = undef,
) {
  include boxen::config
  include ssl::salesloft

  $repo_dir = "${boxen::config::srcdir}/${name}"

  boxen::project { $name:
    dir        => $repo_dir,
    postgresql => true,
    nginx      => true,
    redis      => true,
    memcached  => true,
    mongodb    => $mongodb,
    ruby       => $ruby,
    source     => "SalesLoft/${name}",
  }

  file { "${repo_dir}/config/database.yml":
    content => template('railsapp/database.yml.erb'),
    require => Boxen::Project[$name],
  }

  if $application_yml {
    file { "${repo_dir}/config/application.yml":
      source  => $application_yml,
      require => Boxen::Project[$name],
    }
  }

  if $port {
    file { "${repo_dir}/.env":
      replace => no,
      content => "PORT=${port}",
      require => Repository[$repo_dir],
    }
  }

  exec { "Gemfile ruby version ${repo_dir}":
    cwd         => $repo_dir,
    command     => "sed -i '' \"s/^ruby .*$/ruby '${ruby}'/\" Gemfile",
    onlyif      => "ls Gemfile",
    refreshonly => true,
    subscribe   => Ruby::Local[$repo_dir],
  }
}
