class bower {
  include nodejs
  class { 'nodejs::global': version => 'v0.12' }

  package { 'chrome-cli': }

  npm_module { 'bower':
    node_version => '0.10',
    version => '1.3.12',
  }
}
