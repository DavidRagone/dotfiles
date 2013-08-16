# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# from text-triumvirate post
export EDITOR="vim"
bindkey -v
unsetopt correct_all

# attempt to stop auto-window naming
DISABLE_AUTO_TITLE=true

# increase scrollback lines
set -g history-limit 10000

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=$PATH:/usr/X11/bin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:~/adt-bundle/adt-bundle-mac-x86_64-20130219/sdk/platform-tools:~/adt-bundle/adt-bundle-mac-x86_64-20130219/sdk/tools

# This loads NVM
[[ -s /Users/dmragone/.nvm/nvm.sh ]] && . /Users/dmragone/.nvm/nvm.sh


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
eval "$(rbenv init -)"
