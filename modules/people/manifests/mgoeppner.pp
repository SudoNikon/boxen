class people::mgoeppner {
  $home     = "/Users/${::boxen_user}"

  # Checkout https://github.com/boxen/ for a huge collection of apps you can include.
  # Most core development software should already be included with the railsapp, projects,
  # bower, and ssl manifests that run as a part of boxen.

  # CLI
  include zsh
  include ohmyzsh
  # include iterm2::dev

  # Add theme to personalize
  # include iterm2::colors::solarized_dark

  # Apps
  # include chrome
  # include dropbox
  # include googledrive
  # Slack: https://itunes.apple.com/us/app/slack/id803453959

  # Windows Snap For Mac
  # include shiftit
  # Adapt Display Colors to Time of Day
  # include flux

  # include spotify

  # Editors (Whatever works best for you!)
  # include textmate::textmate2::release
  # include rubymine

  # Atom
  # include atom
  # install the linter package
  # atom::package { 'linter': }

  # install the monokai theme
  # atom::theme { 'monokai': }

  # Sublime
  # include sublime_text
  # sublime_text::package { 'Emmet':
  #   source => 'sergeche/emmet-sublime'
  # }
  # sublime_text::package { 'SideBarEnhancements':
  #   source => 'titoBouzout/SideBarEnhancements'
  # }
  # sublime_text::package { 'Git':
  #   source => 'kemayo/sublime-text-git'
  # }
  # sublime_text::package { 'Sass':
  #   source => 'nathos/sass-textmate-bundle'
  # }
  # file { "$home/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
  #   content  => '{
  #     "font_size": 16,
  #     "ignored_packages":
  #     [
  #       "Vintage"
  #     ],
  #     "trim_trailing_white_space_on_save": true,
  #     "tab_size": 2,
  #     "translate_tabs_to_spaces": true,
  #     "save_on_focus_lost": true,
  #     "ensure_newline_at_eof_on_save": true}'
  # }

  # OS Settings
  # These make backspacing and typing much snappier. Once you try it the defaults feel super slow.
  class { 'osx::global::key_repeat_delay':
    delay => 10
  }
  class { 'osx::global::key_repeat_rate':
    rate => 2
  }

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
    content => template('people/your_github_login/.zshrc.erb')
  }

  include projects::all
}
