class projects::mail_spy {
  railsapp { 'mail_spy':
    port => 9393,
    ruby => '2.2.2',
  }
}
