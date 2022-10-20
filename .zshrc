# ZSH history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt SHARE_HISTORY

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

# Git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gav='git add --verbose'
alias gb='git branch'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dffx'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gfg='git ls-files | grep'
alias gl='git pull'

alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias gloga='git log --oneline --decorate --graph --all'

alias gm='git merge'
alias gmom='git merge origin/$(git_main_branch)'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
alias gma='git merge --abort'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpf!='git push --force'
alias gpr='git pull --rebase'
alias gpv='git push -v'
alias gsw='git switch'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grev='git revert'
alias grh='git reset'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grs='git restore'
alias gru='git reset --'

alias gsi='git submodule init'
alias gss='git status -s'
alias gst='git status'

# Use a long listing format
alias ll='ls -la'

alias ls="gls --color"

# Show hidden files
alias l.='ls -d .* --color=auto'

# Zsh
alias sz="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"

# Search and filesystem
alias s="history | grep"
alias tt="tree -CL 2"

alias doc="nvim ~/.config/myconfig/README.md"
alias h="history"

alias tt="tree -CL 2"

export LS_COLORS="$(vivid generate snazzy)"

# Work specific stuff, do not share so source local file
source "/Users/laudibert/.zshrc_zenefits"

eval "$(starship init zsh)"

export EDITOR="nvim"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
