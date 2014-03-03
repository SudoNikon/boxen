class projects::prospectorjs {

  include nodejs::v0_10
  class { 'nodejs::global': version => 'v0.10' }
  nodejs::module { 'bower':
    node_version => 'v0.10',
    ensure => '1.2.8',
  }

  # Waiting on https://github.com/Homebrew/homebrew/pull/27077
  # package { 'chrome-cli': }

  boxen::project { 'prospectorjs':
    source => 'SalesLoft/prospectorjs'
  }
}
