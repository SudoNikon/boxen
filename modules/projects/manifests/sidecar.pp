class projects::sidecar {
  include nodejs::v0_10
  include bower

  boxen::project { 'sidecar':
    source => 'SalesLoft/sidecar'
  }
}
