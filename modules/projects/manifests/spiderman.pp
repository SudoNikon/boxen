class projects::spiderman {
  railsapp { 'spiderman':
    port    => 9696,
    mongodb => true,
    ruby    => '2.1.1',
  }
}
