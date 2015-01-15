class projects::melody {
  railsapp { 'melody':
    port => 9797,
  }

  ssl::cert { 'localhost.salesloft.com': }

  package {
    'imagemagick': ensure => present;
  }
}
