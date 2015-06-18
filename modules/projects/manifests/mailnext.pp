class projects::mailnext {
  include erlang

  railsapp { 'mailnext':
    port => 9495,
    ruby => '2.2.2',
  }
}
