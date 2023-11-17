export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
unset RBENV_ROOT
eval "$(rbenv init -)"
eval "$(pyenv init --path)"
eval "$(/opt/homebrew/bin/brew shellenv)"
