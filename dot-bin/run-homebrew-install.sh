#!/usr/bin/env zsh
# https://docs.brew.sh/Installation#multiple-installations-unsupported
HOMEBREW_INSTALL_PATH = ~/..homebrew
mkdir ~/$HOMEBREW_INSTALL_PATH && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/$HOMEBREW_INSTALL_PATH
eval "$($HOMEBREW_INSTALL_PATH/bin/brew shellenv)"
which brew
brew install stow
