class people::barberj{
  $home     = "/Users/${::boxen_user}"

  # CLI
  include zsh
  include ohmyzsh
  include iterm2::dev
  include git

  # Apps
  include chrome
  include atom
  #include onepassword
  #include onepassword::chrome
  #include caffeine
  #include spotify

  # OS Settings
  include osx::dock::autohide

  git::config::global { 'alias.done':
    value  => "\"!git checkout master && git pull && git fetch -p && git branch --merged | ggrep -Pv '\\\\*|master' | xargs -n 1 git branch -d\""
  }

  host { 'db':
    ip => '127.0.0.1'
  }

  host { 'puppetmaster':
    ip => '54.226.14.4'
  }

  # Save Screenshots to a folder on the desktop
  file { "$home/Desktop/ScreenShots/":
    ensure => "directory",
  }
  boxen::osx_defaults { 'Save Screenshots to Folder':
    user    => $::boxen_user,
    key     => 'location',
    domain  => 'com.apple.screencapture',
    value   => "$home/Desktop/ScreenShots/",
    notify  => Exec['killall SystemUIServer'],
    require => File["$home/Desktop/ScreenShots/"]
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
    'erlang',
    'elixir',
    'tmux'
    ]:
  }

  file { "$home/.zshrc":
    content => template('people/barberj/.zshrc.erb')
  }
  file { "$home/.darwinrc":
    content => template('people/barberj/.darwinrc.erb')
  }
  file { "$home/.dockerrc":
    content => template('people/barberj/.dockerrc.erb')
  }

  include projects::all
}
