class bower {
  include nodejs
  class { 'nodejs::global': version => 'v0.12' }

  package { 'chrome-cli': }

  nodejs::module { 'bower':
    node_version => 'v0.10',
    ensure => '1.3.12',
  }
}
