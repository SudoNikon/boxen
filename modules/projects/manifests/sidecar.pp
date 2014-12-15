class projects::sidecar {
  include bower

  boxen::project { 'sidecar':
    source => 'SalesLoft/sidecar'
  }
}
