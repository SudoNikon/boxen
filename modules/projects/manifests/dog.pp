class projects::dog {
  railsapp { 'dog':
    port => 9595,
    ruby => '2.1.2',
  }
}
