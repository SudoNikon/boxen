class people::hwhelchel {

  $home     = "/Users/${::boxen_user}"

  # CLI
  include zsh
  include ohmyzsh
  include iterm2::dev
  include iterm2::colors::solarized_dark

  # Productivity
  include chrome
  include dropbox
  include googledrive
  include shiftit
  include flux
  include alfred

  # Editors
  include sublime_text
  include rubymine

  # OS Settings
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::keyboard::capslock_to_control
  include osx::software_update
  include osx::no_network_dsstores
  class { 'osx::global::key_repeat_delay':
    delay => 10
  }
  class { 'osx::global::key_repeat_rate':
    rate => 2
  }

  # Support Tim(e) Capsule
  boxen::osx_defaults { 'Show Unsupported Time Machine Volumes':
    user    => $::boxen_user,
    key     => 'TMShowUnsupportedNetworkVolumes',
    domain  => 'com.apple.systempreferences',
    value   => true,
  }

  nodejs::version { 'v0.12': }

  package { 'htop-osx': }
  package { 'the_silver_searcher': }

  # Sublime Packages
  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  sublime_text::package { 'SideBarEnhancements':
    source => 'titoBouzout/SideBarEnhancements'
  }
  sublime_text::package { 'Git':
    source => 'kemayo/sublime-text-git'
  }
  sublime_text::package { 'Sass':
    source => 'nathos/sass-textmate-bundle'
  }

  file { "$home/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
    content  => '{
      "color_scheme": "Packages/User/base16-default.dark (SL).tmTheme",
      "font_size": 16,
      "ignored_packages":
      [
        "Vintage"
      ],
      "trim_trailing_white_space_on_save": true,
      "tab_size": 2,
      "translate_tabs_to_spaces": true,
      "save_on_focus_lost": true,
      "ensure_newline_at_eof_on_save": true,
      "rulers":
      [
        80
      ]}
      '
  }


  file { "$home/.zshrc":
    content => template('people/hwhelchel/.zshrc.erb')
  }

  include projects::all
}
