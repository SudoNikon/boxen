class projects::spiderman {
  include elasticsearch

  railsapp { 'spiderman':
    port    => 9696,
    mongodb => true,
    ruby    => '2.1.1',
  }
}
