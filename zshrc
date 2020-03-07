source ./zshrc.square

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
  #source ~/.zsh-local

# }}}

#**** Aliases {{{
  # Play with this file a lot
  alias resource="source ~/.zshrc"

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

  # Directory jumping
  alias d='dirs -v | head -10'
  alias 1='cd -'
  alias 2='cd -2'
  alias 3='cd -3'
  alias 4='cd -4'
  alias 5='cd -5'
  alias 6='cd -6'
  alias 7='cd -7'
  alias 8='cd -8'
  alias 9='cd -9'
# }}}

#**** Custom functions {{{
  # Print the TODOs entered in code since the first time the current branch
  #   split off of master
  TODO() {
    gd $(git log master... --oneline | tail -1 | cut -f 1 -d " ") | grep TODO
  }

  # Figure out what % someone is in commits in the current repo over n months
  most() {
    output=$(git log --since=12.months --numstat --pretty="%ae %H" ":(exclude)protos" ":(exclude)mocks" ":(exclude)vendor"\
      | sed 's/@.*//g' \
      | awk '{if(NF==1){name=$1};if(NF==3){plus[name]+=$1;minus[name]+=$2}}END{for(name in plus){print name": +"plus[name]" -"minus[name]}}' \
      | sort -k2 -gr \
      | cat -n
    )

    if [ "$1" != "" ]
    then
      readonly person=$1
      echo $output | grep $person
    else
      echo $output
    fi
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

  # Make ctrl+r history search work
  bindkey "^R" history-incremental-pattern-search-backward
  bindkey "^N" history-incremental-pattern-search-forward

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

#**** notes taking cli {{{
  notes() {
    local fpath=$HOME/notes.md
    if [ "$1" = "vim" ]; then
      vim + $fpath
    elif [ "$1" = "date" ]; then
      echo '# '`date +"%m-%d-%Y-%T"` >> $fpath
      echo '---------------------' >> $fpath
    elif [ "$1" = "" ]; then
      less +G $fpath
    else
      echo -n '# '`date +"%m-%d-%Y-%T"` >> $fpath
      echo -n ' --- ' >> $fpath
      echo $@ >> $fpath
    fi
  }
# }}}

#**** Load NVM {{{
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# }}}

#**** TODO - clean up all the PATH references {{{
  export PATH="$HOME/.bin:$PATH"
  # SQ puts go elsewhere
  #export GOPATH="$HOME/Projects/golang:$HOME/Projects/learning-time/go"
# }}}

# vim:foldmethod=marker:foldlevel=0


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidr/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/davidr/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidr/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/davidr/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# To solve when it breaks: https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#macOS-catalina-1015
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
