#DavidRagone's dotfiles.

##Usage
####Clone repo
```git clone https://github.com/DavidRagone/dotfiles.git```
####Delete your existing related files
For each of: .gitconfig, .oh-my-zsh/, .tmux.conf, .vimrc, .zprofile, .zshrc, either remove or rename (e.g. .gitconfig-old)
####Symlink each of those files (or folder in the case of .oh-my-zsh/) to the dotfile repo
```ln -s /actual-file ~/file-you-want-symlinked```
####Switch to zsh
`chsh -s /bin/zsh`

## TODO
* Write script for auto symlinking and intalling dependencies
* Add install step for silver searcher?
