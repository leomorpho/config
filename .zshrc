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

# Zsh
alias sz="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"

# Search and filesystem
alias s="history | grep"
alias tt="tree"

# Work specific stuff, do not share so source local file
source "/Users/laudibert/.zshrc_zenefits"

eval "$(starship init zsh)"

export EDITOR="nvim"
