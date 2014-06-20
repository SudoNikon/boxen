class projects::prospectorjs {

  include nodejs::v0_10
  include bower

  boxen::project { 'prospectorjs':
    source => 'SalesLoft/prospectorjs'
  }
}
