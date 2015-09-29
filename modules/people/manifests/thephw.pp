class people::thephw {
  include bash
  include bash::completion
  include chrome
  include dropbox
  include googledrive

  # OS Settings
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::global::enable_standard_function_keys
  include osx::global::tap_to_click
  include osx::dock::autohide

  # Save Screenshots to a folder on the desktop
  file { "/Users/${::boxen_user}/Dropbox/Screenshots/":
    ensure  => "directory",
    require => Class["dropbox"],
  }
  boxen::osx_defaults { 'Save Screenshots to Folder':
    user    => $::boxen_user,
    key     => 'location',
    domain  => 'com.apple.screencapture',
    value   => "/Users/${::boxen_user}/Dropbox/Screenshots/",
    notify  => Exec['killall SystemUIServer'],
    require => File["/Users/${::boxen_user}/Dropbox/Screenshots/"],
  }
  exec { 'killall SystemUIServer':
    refreshonly => true,
  }

  # Homebrew bash completion
  file { "$homebrew::config::installdir/etc/bash_completion.d/brew":
    ensure => "$homebrew::config::installdir/Library/Contributions/brew_bash_completion.sh",
  }

  package { 'htop-osx': }
  package { 'mtr': }
  package { 'heroku-toolbelt': }

  include projects::barge
  include projects::crm_repo
  include projects::dog
  include projects::gandalf
  include projects::mailnext
  include projects::mailx
  include projects::melody
  include projects::prospector
  include projects::prospectorjs
  include projects::puppetmaster
  include projects::river
  include projects::rolodex
  include projects::salesloft-ruby
  include projects::salesloft-sso
  include projects::sidecar
  #include projects::spiderman
}
