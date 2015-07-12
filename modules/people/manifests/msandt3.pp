class people::msandt3 {
	$home = "Users/${::boxen_user}"

	# CLI
	include iterm2::dev
	include iterm2::colors::solarized_dark
	include git
	include homebrew

	# Productivity
	include chrome
	include dropbox
	include googledrive
	include flux

	# Editors
	include sublime_text

	# Utilities
	include foreman
	include elasticsearch
	include memcached
	include nodejs
	include phantomjs
	include openssl
	include nginx
	include imagemagick


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

	file { "/$home/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
		content  => '{
			"theme": "Numix Dark.sublime-theme",
			"font_size": 12,
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
			]},
			"ensure_newline_at_eof_on_save": true
			'
  }
  include projects::all
}