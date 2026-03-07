# Switch shell to zsh
chsh -s /bin/zsh

# zsh
ln -s ~/dotfiles/.zlogin ~/.zlogin
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zenv ~/.zenv

# Git
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# Claude Code (Don't overwrite the existing files!)
mkdir -p ~/.claude
ln -s ~/dotfiles/.claude/CLAUDE.md ~/.claude/CLAUDE.md

# Emacs
ln -s ~/dotfiles/.emacs.d ~/.emacs.d
