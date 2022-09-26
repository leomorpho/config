HOME="/Users/laudibert"
CONFIG_PATH="$HOME/.config/myconfig"

ln -s "$CONFIG_PATH/nvim" "$HOME/.config/nvim"
ln -s "$CONFIG_PATH/.zshrc" "$HOME/.zshrc"

# Nerd Fonts for your IDE
# https://www.nerdfonts.com/font-downloads
brew tap homebrew/cask-fonts && brew install --cask font-3270-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-fira-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-inconsolata-go-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-inconsolata-lgc-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-inconsolata-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-monofur-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-overpass-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-ubuntu-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-agave-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-arimo-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-anonymice-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-aurulent-sans-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-bigblue-terminal-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-bitstream-vera-sans-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-blex-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-caskaydia-cove-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-code-new-roman-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-cousine-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-daddy-time-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-dejavu-sans-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-droid-sans-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-fantasque-sans-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-go-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-gohufont-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-hasklug-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-heavy-data-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-hurmit-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-im-writing-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-iosevka-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-lekton-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-liberation-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-monoid-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-mononoki-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-mplus-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-noto-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-open-dyslexic-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-profont-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-proggy-clean-tt-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-roboto-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-sauce-code-pro-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-shure-tech-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-space-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-terminess-ttf-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-tinos-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-ubuntu-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-victor-mono-nerd-font

# Tmux
brew install tmux
ln -s -f $CONFIG_PATH/tmux/.tmux.conf ~/.tmux.conf
cp $CONFIG_PATH/tmux/.tmux.conf.local ~/.tmux.conf.local
tmux source-file ~/.tmux.conf

set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-yank'

# Tmuxinator: Manage complex tmux sessions easily
gem install tmuxinator
# if you installed tmuxinator via Ruby's gem, you'll need to run the following commands to put the completion files where they'll be loaded by your shell.
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator


# Starship Shell: The minimal, blazing-fast, and infinitely customizable prompt for any shell!
# https://github.com/starship/starship
curl -sS https://starship.rs/install.sh | sh
