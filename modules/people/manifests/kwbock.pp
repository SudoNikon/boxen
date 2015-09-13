class people::kwbock {
  $home     = "/Users/${::boxen_user}"

  # Checkout https://github.com/boxen/ for a huge collection of apps you can include.
  # Most core development software should already be included with the railsapp, projects,
  # bower, and ssl manifests that run as a part of boxen.

  # CLI
  include zsh
  include ohmyzsh
  include iterm2::dev
  include iterm2::colors::solarized_dark

  include osx::global::tap_to_click

  # Apps
  include chrome
  include dropbox
  include googledrive
  # Slack: https://itunes.apple.com/us/app/slack/id803453959

  # Atom
  include atom
  # install the linter package
  atom::package { 'linter': }

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

  package { 'htop-osx': }
  package { 'the_silver_searcher': }
  package { 'heroku-toolbelt': }

  # file { "$home/.zshrc":
  #   content => template('people/kwbock/.zshrc.erb')
  # }

  include projects::all
}
