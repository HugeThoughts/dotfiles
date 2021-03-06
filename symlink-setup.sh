#!/bin/bash

# Set up symlinks
if [ -f "$HOME/.bashrc" ]
then
  mv ~/.bashrc ~/.bashrc.old
fi
ln -s ~/dotfiles/.bashrc ~/.bashrc

if [ -f "$HOME/.zshrc" ]
then
  mv ~/.zshrc ~/.zshrc.old
fi

ln -s ~/dotfiles/.zshrc ~/.zshrc


ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gitignore ~/.gitignore
ln -sf ~/dotfiles/.gemrc ~/.gemrc



#	----------	OSX Stuffs -------------

if [ "$(uname)" == "Darwin" ]; then
	ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi