class projects::salesloft-sso {
  boxen::project { 'salesloft-sso':
    source => 'SalesLoft/salesloft-sso',
    ruby   => '2.1.2',
  }
}
