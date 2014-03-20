class projects::salesloft-ruby {
  boxen::project { 'salesloft-ruby':
    source => 'SalesLoft/salesloft-ruby',
    ruby   => '2.1.0',
  }
}
