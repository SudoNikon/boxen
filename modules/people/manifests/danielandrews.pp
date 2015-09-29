class people::danielandrews {
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

  # OS
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files

  # Support Tim(e) Capsule
  boxen::osx_defaults { 'Show Unsupported Time Machine Volumes':
    user    => $::boxen_user,
    key     => 'TMShowUnsupportedNetworkVolumes',
    domain  => 'com.apple.systempreferences',
    value   => true,
  }

  package { 'htop-osx': }
  package { 'mtr': }
  package { 'heroku-toolbelt': }

  include projects::all
}
