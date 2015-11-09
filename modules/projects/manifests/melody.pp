class projects::melody {
  include elasticsearch

  railsapp { 'melody':
    port           => 9797,
    ruby           => '2.1.5',
    parallel_tests => true
  }

  package {
    'imagemagick':  ensure => present;
    'ghostscript':  ensure => present;
    'chromedriver': ensure => present;
  }
}
