class people::sionide21 {
  include bash
  include bash::completion
  include chrome
  include dropbox
  include gitx
  include googledrive
  include hipchat
  include iterm2::dev
  include textmate

  # OS Settings
  include osx::global::enable_standard_function_keys
  include osx::global::tap_to_click
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
  boxen::osx_defaults { 'Show Unsupported Time Machine Volumes ':
    user    => $::boxen_user,
    key     => 'TMShowUnsupportedNetworkVolumes',
    domain  => 'com.apple.systempreferences',
    value   => true,
  }

  # Homebrew bash completion
  file { "$homebrew::config::installdir/etc/bash_completion.d/brew":
    ensure => "$homebrew::config::installdir/Library/Contributions/brew_bash_completion.sh",
  }

  package { 'htop-osx': }

  package { 'heroku-toolbelt': }

  include projects::all
}
