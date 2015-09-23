class projects::dog {
  railsapp { 'dog':
    port => 9595,
    ruby => '2.2.2'
  }
}
