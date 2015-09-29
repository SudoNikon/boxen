class projects::gandalf {
  railsapp { 'gandalf':
    port => 9898,
    ruby => '2.2.2'
  }
}
