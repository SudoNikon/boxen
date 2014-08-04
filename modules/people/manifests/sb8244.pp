class people::sb8244 {
  include zsh
  include chrome
  include dropbox
  include gitx
  include googledrive
  include hipchat
  include iterm2::dev
  include sublime_text

  # Homebrew bash completion
  file { "$homebrew::config::installdir/etc/bash_completion.d/brew":
    ensure => "$homebrew::config::installdir/Library/Contributions/brew_bash_completion.sh",
  }

  package { 'htop-osx': }

  package { 'heroku-toolbelt': }

  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  include projects::all
}
