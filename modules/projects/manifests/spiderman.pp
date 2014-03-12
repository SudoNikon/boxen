class projects::spiderman {
  railsapp { 'spiderman':
    port    => 9696,
    mongodb => true,
  }
}
