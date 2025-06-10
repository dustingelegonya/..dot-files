#!/usr/bin/env zsh
# https://docs.brew.sh/Installation#multiple-installations-unsupported
DOTFILES_DIR=$HOME/..dot-files
DOTFILES=$DOTFILES_DIR
HOMEBREW_INSTALL_PATH=$HOME/.homebrew

#cp dotfiles $DOTFILES_DIR

mkdir $HOMEBREW_INSTALL_PATH
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOMEBREW_INSTALL_PATH
eval "$($HOMEBREW_INSTALL_PATH/bin/brew shellenv)"
which brew
brew install stow starship tree --cask ghostty
stow --dotfiles --dir=$DOTFILES .
#source $HOME/$DOTFILES/dot-zshrc
exec zsh
