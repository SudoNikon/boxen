class projects::river {
  railsapp { 'river':
    # For now I am not committing this file, you can add your own to projects/files/... if you want to
    # application_yml => 'puppet:///modules/projects/river/application.yml',
    port            => 9292,
    ruby            => '2.1.5',
  }
}
