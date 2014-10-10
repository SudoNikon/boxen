class people::hwhelchel {

  $home     = "/Users/${::boxen_user}"

  # CLI
  include zsh
  include ohmyzsh
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include git
  include homebrew

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

  # Utilities
  include foreman
  include elasticsearch
  include memcached
  include nodejs
  include phantomjs
  include openssl
  include nginx
  include imagemagick

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

  # Homebrew bash completion
  file { "$homebrew::config::installdir/etc/bash_completion.d/brew":
    ensure => "$homebrew::config::installdir/Library/Contributions/brew_bash_completion.sh"
  }

  # Homebrew Packages
  package { 'bash': }
  package { 'htop-osx': }
  package { 'heroku-toolbelt': }
  package { 'the_silver_searcher': }

  # Sublime Packages
  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  sublime_text::package { 'AdvancedNewFile':
    source => 'skuroda/Sublime-AdvancedNewFile'
  }
  sublime_text::package { 'SublimeLinter':
    source => 'SublimeLinter/SublimeLinter3'
  }
  sublime_text::package { 'SideBarEnhancements':
    source => 'titoBouzout/SideBarEnhancements'
  }
  sublime_text::package { 'SublimeCodeIntel':
    source => 'SublimeCodeIntel/SublimeCodeIntel'
  }
  sublime_text::package { 'HTML5':
    source => 'mrmartineau/HTML5'
  }
  sublime_text::package { 'BracketHighlighter':
    source => 'facelessuser/BracketHighlighter'
  }
  sublime_text::package { 'Git':
    source => 'kemayo/sublime-text-git'
  }
  sublime_text::package { 'jQuery':
    source => 'SublimeText/jQuery'
  }
  sublime_text::package { 'Sass':
    source => 'nathos/sass-textmate-bundle'
  }
  sublime_text::package { 'JsFormat':
    source => 'jdc0589/JsFormat'
  }
  sublime_text::package { 'GitGutter':
    source => 'jisaacks/GitGutter'
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
