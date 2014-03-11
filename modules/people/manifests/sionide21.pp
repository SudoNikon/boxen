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

  # Homebrew bash completion
  file { "$homebrew::config::installdir/etc/bash_completion.d/brew":
    ensure => "$homebrew::config::installdir/Library/Contributions/brew_bash_completion.sh",
  }

  package { 'htop-osx': }

  package { 'heroku-toolbelt': }

  include projects::all
}
