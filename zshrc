# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
#   time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="dragone"
#ZSH_THEME="afowler"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gac="git add . && git commit -m 'WIP'"
alias c="clear"
alias gs="git status"
alias gco="git checkout"
alias gcm="git checkout master"
alias gdm='git diff master'
alias gd='git diff'
alias grm='git rebase -i master'

# Functions
top10() {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -20
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="~/.rbenv/bin:/usr/local/mysql:/usr/local/bin:/usr/local/sbin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:~/adt-bundle/adt-bundle-mac-x86_64-20130219/sdk/platform-tools:~/adt-bundle/adt-bundle-mac-x86_64-20130219/sdk/tools/usr/X11/bin:$HOME/.rvm/bin"

# ZSH Local = where to put everything not to be shared across machines
# Note that env will now be shared across machines, so not safe for passwords
source ~/.zsh-local

# from text-triumvirate post
export EDITOR="vim"
bindkey -v
unsetopt correct_all
unsetopt correct

# attempt to stop auto-window naming
DISABLE_AUTO_TITLE=true

# increase scrollback lines
set -g history-limit 10000

# This loads NVM
[[ -s /Users/dmragone/.nvm/nvm.sh ]] && . /Users/dmragone/.nvm/nvm.sh

