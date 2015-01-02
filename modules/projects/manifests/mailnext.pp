class projects::mailnext {
  include erlang

  railsapp { 'mailnext':
    port => 9495
  }
}
