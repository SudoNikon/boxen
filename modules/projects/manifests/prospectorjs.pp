class projects::prospectorjs {

  include nodejs::v0_10
  include bower

  # Waiting on https://github.com/Homebrew/homebrew/pull/27077
  # package { 'chrome-cli': }

  boxen::project { 'prospectorjs':
    source => 'SalesLoft/prospectorjs'
  }
}
