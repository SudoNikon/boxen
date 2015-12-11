class projects::spiderman {
  include elasticsearch

  railsapp { 'spiderman':
    port    => 9696,
    ruby    => '2.1.1',
  }
}
