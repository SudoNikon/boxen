class people::sionide21 {
  include bash
  include bash::completion
  include chrome
  include dropbox
  include gitx
  include hipchat
  include iterm2::dev
  include textmate

  file { "$homebrew::config::installdir/etc/bash_completion.d/brew":
    ensure => "$homebrew::config::installdir/Library/Contributions/brew_bash_completion.sh",
  }

  include projects::all
}
