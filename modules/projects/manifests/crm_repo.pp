class projects::crm_repo {
  railsapp { 'crm_repo':
    # For now I am not committing this file, you can add your own to projects/files/... if you want to
    # application_yml => 'puppet:///modules/projects/crm_repo/application.yml',
    port => 9191,
    ruby => '2.2.2'
  }
}
