class projects::prospectorjs {
  include bower

  boxen::project { 'prospectorjs':
    source => 'SalesLoft/prospectorjs'
  }
}
