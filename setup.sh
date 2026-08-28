set -e

# Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  brew update && brew upgrade
fi

# CLI tools
brew install zsh git tmux herdr

# GUI apps
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask ghostty
brew install --cask alfred
brew install --cask obsidian
brew install --cask codex
brew install --cask claude-code
brew install --cask sublime-text
brew install --cask visual-studio-code
brew install --cask intellij-idea
brew install --cask zed
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask zoom
brew install --cask rancher
brew install --cask google-japanese-ime

# Install check
brew list

# Switch shell to zsh
chsh -s "$(which zsh)"

# Config files

# zsh
ln -s ~/dotfiles/zsh/.zlogin ~/.zlogin
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/dotfiles/zsh/.zprofile ~/.zprofile

# Git
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig

# tmux
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# herdr
mkdir -p ~/.config/herdr
ln -s ~/dotfiles/herdr/config.toml ~/.config/herdr/config.toml

# Codex
mkdir -p ~/.codex
ln -s ~/dotfiles/AGENTS.md ~/.codex/AGENTS.md

# Claude Code (Don't overwrite the existing files!)
mkdir -p ~/.claude
ln -s ~/dotfiles/claude-code/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/dotfiles/claude-code/settings.json ~/.claude/settings.json
