class projects::rolodex {
  include elasticsearch

  railsapp { 'rolodex':
    port    => 9594,
    ruby    => '2.2.2',
  }
}
