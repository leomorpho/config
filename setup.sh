# #!/usr/bin/env bash

HOME="/Users/laudibert"
CONFIG_PATH="$HOME/.config/myconfig"

# Check that Python3 is installed
if which python3 > /dev/null 2>&1;
then
    python_version=`python3 --version 2>&1 | awk '{print $2}'`
    echo "Python version $python_version is installed."
else
    echo "No Python3 executable is found. Aborting script run."
    exit
fi

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew unlink neovim
brew install --HEAD neovim
brew install julia java php composer node wget tmux bat git-imerge vivid gnu-sed pre-commit
# For C-Tags
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Install rust, used in some nvim plugins
curl https://sh.rustup.rs -sSf | sh

# Lua support for Nvim edits
cargo install stylua
cargo install stylua --features lua52
cargo install stylua --features lua53
cargo install stylua --features lua54
cargo install stylua --features luau

ln -s "$CONFIG_PATH/nvim" "$HOME/.config/nvim"
ln -s "$CONFIG_PATH/.zshrc" "$HOME/.zshrc"

# sharkdp/vivid: A themeable LS_COLORS generator with a rich filetype datebase
brew install coreutils
alias ls="gls --color"

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
ln -s -f $CONFIG_PATH/tmux/tmux.conf ~/.tmux.conf
ln -s -f $CONFIG_PATH/tmux/tmux.conf.local ~/.tmux.conf.local
tmux source-file ~/.tmux.conf

# Install Tmux TPM plugins
$TMUX_PLUGIN_MANAGER_PATH/tpm/scripts/install_plugins.sh

# Tmuxp: tmux session manager. built on libtmux
brew install tmuxp

# Starship Shell: The minimal, blazing-fast, and infinitely customizable prompt for any shell!
# https://github.com/starship/starship
curl -sS https://starship.rs/install.sh | sh

# WTF util
brew tap wtfutil/wtfutil
brew install wtfutil
ln -s ~/.config/myconfig/wtfutil/config.yml ~/.config/wtf/config.yml
