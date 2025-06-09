#!/usr/bin/env bash
# this will create backups of all dotfiles that might be replaced.

#mv ~/Music ~/Music.bak
stow --dotfiles . && exec zsh
