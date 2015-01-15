class projects::melody {
  railsapp { 'melody':
    port => 9797,
    ruby => '2.1.5',
  }

  package {
    'imagemagick': ensure => present;
  }
}
