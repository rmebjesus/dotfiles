#!/bin/bash

# PURPOSE: deploy dotfiles in the home directory while backing up existing ones.

# REQUIRES: ~/dotfiles directory containing dotfiles to be linked in homedir.

DOTFILES_DIR=~/dotfiles
TIME=$( date +"%Y%m%d" )
BACKUP_DIR=~/dotfiles_$TIME
DOTFILES=".aliases .bash_profile .bash_prompt .bashrc .editorconfig .exports .functions .vimrc"

# backup existing dotfiles and create symlinked dotfiles in homedir
echo "Moving any existing dotfiles to $BACKUP_DIR..."
mkdir -p $BACKUP_DIR
cd $DOTFILES_DIR

for FILE in $DOTFILES; do
  mv ~/$FILE $BACKUP_DIR
  echo "Symlinking $FILE to the home directory."
  ln -s $DOTFILES_DIR/$FILE ~/$FILE
done

source ~/.bashrc

echo "Done!"
