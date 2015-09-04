class projects::ticket_booth {
  railsapp { 'ticket_booth':
    port => 9001,
    ruby => '2.2.2',
  }
}
