#!/usr/bin/env zsh
# this will create backups of all dotfiles that might be replaced.
#
TIMESTAMP=$(date +%Y%m%d%H%M%S)
STOW_BACKUP_DIR="$TIMESTAMP-STOW-BACKUPS"

#mv ~/Music ~/Music.bak


# Make backups of dotfiles already on sytem if there are any

mkdir $HOME/$STOW_BACKUP_DIR
mv $HOME/.config $STOW_BACKUP_DIR/config
mv $HOME/.zshrc $STOW_BACKUP_DIR/zshrc
mv $HOME/.zprofile $STOW_BACKUP_DIR/zprofile
mv $HOME/.gitconfig $STOW_BACKUP_DIR/gitconfig

# mv Desktop $STOW_BACKUP_DIR/Desktop

echo "remember that currenlty stowed dotfiles will not be backed up becauses they are only aliases."

echo "Backup completed - Located here: $STOW_BACKUP_DIR"
