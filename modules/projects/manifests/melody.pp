class projects::melody {
  include elasticsearch

  railsapp { 'melody':
    port => 9797,
    ruby => '2.1.5',
  }

  package {
    'imagemagick': ensure => present;
    'ghostscript': ensure => present;
  }

  file { "${repo_dir}/config/database.yml":
    content => template('railsapp/parallel_tests_database.yml.erb'),
    require => Boxen::Project[$name],
  }
}
