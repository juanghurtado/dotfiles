require 'rake'
require 'fileutils'

desc "Install system tools and dotfiles. Tested on OSX Mavericks."

task :install do
	primary_message "Performing install"

	install_command_line_tools
	install_homebrew
	install_git
	install_zsh
	install_node

	make_simlinks

	install_ruby
	install_node
	install_vim
	install_tmux
	install_z
	install_ag
end

task :default => 'install'

private

def run(cmd)
	puts "[Running] #{cmd}"
	`#{cmd}` unless ENV['DEBUG']
end

def primary_message(message)
	puts
	puts "==================================================="
	puts message
	puts "==================================================="
	puts
end

def secondary_message(message)
	puts
	puts "---------------------------------------------------"
	puts message
	puts "---------------------------------------------------"
	puts
end

def install_command_line_tools
	secondary_message "Installing OSX Command Line Tools..."

	puts "Wait until OSX Command Line Tools are installed (external window) and then --PRESS ENTER-- to continue..."
	run "xcode-select --install"

	STDIN.gets.chomp
end

def install_homebrew
	run %{which brew}

	unless $? != nil and $?.success?
		secondary_message "Installing Homebrew..."
		run %{ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"}
	end
	
	puts "Updating Homebrew..."
	run %{brew update}
end

def install_git
	secondary_message "Installing Git..."

	run %{brew install git git-extras}
end

def install_zsh
	secondary_message "Installing ZSH..."

	run %{brew install zsh}

	puts "Adding ZSH to the list of available shells"
	run %{echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells}

	puts "Changing shell to ZSH for your user and for root"
	run %{chsh -s /usr/local/bin/zsh}
	run %{sudo chsh -s /usr/local/bin/zsh}

	puts "Installing 'reattach-to-user-namespace' in order to get a sane clipboard behaviour"
	run %{brew install reattach-to-user-namespace}
end

def install_ruby
	secondary_message "Installing Ruby..."

	puts "Installing rbenv..."
	run %{brew install ruby-build rbenv}

	puts "Installing Ruby 2.0.0-p353..."
	run %{rbenv install 2.0.0-p353}
	run %{rbenv rehash && rbenv global 2.0.0-p353}

	puts "Installing global gems: bundler, rake"
	run %{gem install bundler rake}

	puts "Installing rbenv plugins: rbenv-bundler, rbenv-gem-rehash, rbenv-gemset"
	run %{brew install rbenv-bundler rbenv-gem-rehash rbenv-gemset}
end

def install_node
	secondary_message "Installing NodeJS..."

	run %{brew install nodejs}

	puts "Installing global NPM packages: Grunt and Bower"
	run %{npm install -g grunt-cli bower}
end

def install_vim
	secondary_message "Installing Vim..."

	run %{brew install macvim --override-system-vim}
end

def install_tmux
	secondary_message "Installing tmux..."

	run %{brew install tmux}
	run %{gem install tmuxinator}
end

def install_z
	secondary_message "Installing z..."

	run %{brew install z}
end

def install_ag
	secondary_message "Installing Ag (Silver Searcher)"
	
	run %{brew install ag}
end

def make_simlinks
	secondary_message "Symlinking dotfiles..."

	linkables = Dir.glob('*/**{.symlink}')

	skip_all = false
	overwrite_all = false
	backup_all = false

	linkables.each do |linkable|
		overwrite = false
		backup = false

		file = linkable.split('/').last.split('.symlink').last
		target = "#{ENV["HOME"]}/.#{file}"

		if File.exists?(target) || File.symlink?(target)
			unless skip_all || overwrite_all || backup_all
				puts "File already exists: #{target}, what do you want to do?\n[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
				case STDIN.gets.chomp
				when 'o' then overwrite = true
				when 'b' then backup = true
				when 'O' then overwrite_all = true
				when 'B' then backup_all = true
				when 'S' then skip_all = true
				end
			end
			FileUtils.rm_rf(target) if overwrite || overwrite_all and not ENV['DEBUG']
			run "mv $HOME/.#{file} $HOME/.#{file}.backup" if backup || backup_all
		end
		run "ln -s $PWD/#{linkable} #{target}"
	end
end
