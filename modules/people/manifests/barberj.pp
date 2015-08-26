class people::barberj{
  $home     = "/Users/${::boxen_user}"

  # CLI
  include zsh
  include ohmyzsh
  include iterm2::dev

  # Apps
  include chrome
  include onepassword::chrome
  include docker
  include caffeine
  include onepassword
  include erlang
  include elixir
  include spotify
  include atom

  # OS Settings
  include osx::dock::autohide

  # Save Screenshots to a folder on the desktop
  file { "/Users/${::boxen_user}/Desktop/ScreenShots/":
    ensure => "directory",
  }
  boxen::osx_defaults { 'Save Screenshots to Folder':
    user    => $::boxen_user,
    key     => 'location',
    domain  => 'com.apple.screencapture',
    value   => "/Users/${::boxen_user}/Desktop/ScreenShots/",
    notify  => Exec['killall SystemUIServer'],
    require => File["/Users/${::boxen_user}/Desktop/ScreenShots/"],
  }
  exec { 'killall SystemUIServer':
    refreshonly => true,
  }

  # Support Tim(e) Capsule
  boxen::osx_defaults { 'Show Unsupported Time Machine Volumes':
    user    => $::boxen_user,
    key     => 'TMShowUnsupportedNetworkVolumes',
    domain  => 'com.apple.systempreferences',
    value   => true,
  }

  package { [
    'htop-osx',
    'heroku-toolbelt',
    'tmux'
    ]:
  }

  file { "$home/.zshrc":
    content => template('people/templates/barberj/.zshrc.erb')
  }
  file { "$home/.darwinrc":
    content => template('people/templates/barberj/.darwinrc.erb')
  }
  file { "$home/.dockerrc":
    content => template('people/templates/barberj/.dockerrc.erb')
  }

  include projects::all
}
