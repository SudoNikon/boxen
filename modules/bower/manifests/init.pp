class bower {
  include nodejs

  package { 'chrome-cli': }

  npm_module { 'bower':
    module => 'bower',
    node_version => '0.10',
    version => '1.7.0'
  }
}
