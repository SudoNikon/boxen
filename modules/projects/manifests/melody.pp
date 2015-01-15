class projects::melody {
  railsapp { 'melody':
    port => 9797,
  }

  package {
    'imagemagick': ensure => present;
  }
}
