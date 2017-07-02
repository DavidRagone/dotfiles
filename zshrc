#**** References {{{
  # http://www.drbunsen.org/the-text-triumvirate/
  # https://dougblack.io/words/zsh-vi-mode.html
# }}}

#**** general zsh settings {{{
  DISABLE_AUTO_TITLE=true # Don't auto-name new tmux windows
  set -g history-limit 10000 # increase scrollback lines

  export EDITOR="vim" # default editor is vim
  # disable zsh autocorrect for commands and arguments
  unsetopt correct_all
  # disable zsh autocorrect for commands
  unsetopt correct
# }}}

#**** oh-my-zsh, theme, ... {{{
  ZSH=$HOME/.oh-my-zsh
  # Set name of the theme to load. Look in ./oh-my-zsh/themes/
  # Optionally, if you set this to "random", it'll load a random theme each
  #   time that oh-my-zsh is loaded.
  #ZSH_THEME="robbyrussell"
  #ZSH_THEME="afowler"
  ZSH_THEME="dragone"
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

  # ZSH Local = where to put everything not to be shared across machines
  # Note that env will now be shared across machines, so not safe for passwords
  source ~/.zsh-local

# }}}

#**** Aliases {{{
  # General aliases
  alias c="clear"

  # tmux aliases
  alias mux="tmux -2 attach-session -t" # Connect to an existing tmux-session with the given name. Auto-completes!
  alias muxl="tmux ls"
  alias nmux="tmux -2 new-session -s"

  # Git aliases & functions
  alias gs="git status"
  alias gp="git push"
  alias gco="git checkout"
  alias gcm="git checkout master"
  alias gdm='git diff master'
  alias gd='git diff'
  alias grim='git rebase -i master'
  alias wip="git add . && git commit -m 'WIP'"
  alias gib="git branch"
  alias fit="git push -u -f"
# }}}

#**** Custom functions {{{
  # Print the TODOs entered in code since the first time the current branch
  #   split off of master
  TODO() {
    gd $(git log master... --oneline | tail -1 | cut -f 1 -d " ") | grep TODO
  }

  # Pushes to a remote branch on origin with the same name as the current branch,
  #   e.g. equivalent to `git push -u origin foo` if you're on branch foo
  upstream() {
    # TODO - apparently (per @jonabrams) this can be done with git config push "current"
    git push -u origin `git symbolic-ref --short HEAD`
  }

  # Print list of top 10 most used commands (useful for figuring out what new
  #   aliases/functions I should add)
  top10() {
    # TODO - is this working?
    history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -20
  }

  # Update ctags for ruby files
  tagit() {
    echo "Updating ctags"
    ctags --tag-relative --exclude=.git --languages=ruby -R * `gem env gemdir`/gems/*
    echo "Ctags updated"
  }
# }}}

#**** vi mode and display of when in `normal` mode in zsh {{{
  bindkey -v # set vi mode in zsh
  export KEYTIMEOUT=1 # Reduce delay after hitting escape key to go to normal mode in shell

  zle -N zle-line-init # Executed every time the line editor is started to read a new line of input.
  zle -N zle-keymap-select # Executed every time the keymap changes

  function zle-line-init zle-keymap-select {
      VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
      RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
      zle reset-prompt
  }
# }}}

#**** Setup autojump - use w/ `j directory` {{{
  # see https://github.com/wting/autojump
  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# }}}

#**** Load NVM {{{
  [[ -s /Users/dmragone/.nvm/nvm.sh ]] && . /Users/dmragone/.nvm/nvm.sh
# }}}

#**** TODO - clean up all the PATH references {{{
  export PATH="$HOME/.bin:$PATH"
  export PATH="~/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
# }}}

#**** recommended by brew doctor {{{
  export PATH="/usr/local/bin:$PATH"
  eval "$(rbenv init - --no-rehash zsh)"
# }}}

# vim:foldmethod=marker:foldlevel=0
