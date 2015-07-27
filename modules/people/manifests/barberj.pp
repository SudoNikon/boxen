class people::barberj{
  $home     = "/Users/${::boxen_user}"

  # Checkout https://github.com/boxen/ for a huge collection of apps you can include.
  # Most core development software should already be included with the railsapp, projects,
  # bower, and ssl manifests that run as a part of boxen.

  # CLI
  include zsh
  include ohmyzsh
  include iterm2::dev

  # Apps
  include chrome
  # Slack: https://itunes.apple.com/us/app/slack/id803453959
  include docker

  # Windows Snap For Mac
  # include shiftit
  # Adapt Display Colors to Time of Day
  # include flux

  include spotify

  # Atom
  include atom
  # install the linter package
  # atom::package { 'linter': }

  # install the monokai theme
  # atom::theme { 'monokai': }

  # OS Settings
  # These make backspacing and typing much snappier. Once you try it the defaults feel super slow.
  # class { 'osx::global::key_repeat_delay':
  #   delay => 10
  # }
  # class { 'osx::global::key_repeat_rate':
  #   rate => 2
  # }

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

  file { "$home/.zshrc":
    content => template('people/templates/barberj/.zshrc.erb')
  }

  include projects::all
}
