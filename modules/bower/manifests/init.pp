class bower {
  include nodejs::v0_10
  class { 'nodejs::global': version => 'v0.10' }

  package { 'chrome-cli': }

  nodejs::module { 'bower':
    node_version => 'v0.10',
    ensure => '1.2.8',
  }
}
