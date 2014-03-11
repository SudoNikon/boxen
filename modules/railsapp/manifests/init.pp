define railsapp (
  $application_yml = undef,
  $port            = undef,
  $ruby            = '2.0.0',
) {
  include boxen::config

  $repo_dir = "${boxen::config::srcdir}/${name}"

  boxen::project { $name:
    dir        => $repo_dir,
    postgresql => true,
    nginx      => true,
    redis      => true,
    memcached  => true,
    ruby       => $ruby,
    source     => "SalesLoft/${name}",
  }

  file { "${repo_dir}/config/database.yml":
    content  => template('railsapp/database.yml.erb'),
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
      content => "PORT=${port}",
      require => Repository[$repo_dir],
    }
  }
}
