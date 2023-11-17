export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
unset RBENV_ROOT
eval "$(rbenv init -)"
eval "$(pyenv init --path)"
eval "$(/opt/homebrew/bin/brew shellenv)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
