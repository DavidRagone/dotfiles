export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
