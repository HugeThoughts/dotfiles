#!/bin/bash

#check whether .aliases files is imported into my bashrc else it will do it
grep -q "source ~/dotfiles/.path" ~/.zshrc
if !([ $? -eq 0 ]) then
  sudo echo "source ~/dotfiles/.path" >> ~/.zshrc
fi

ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/.gitignore ~/.gitignore


# WARNING .gemrc file will be deleted and soft link will be created
if [ -f "~/.gemrc" ]
then
	rm ~/.gemrc
	ln -sf ~/dotfiles/.gemrc ~/.gemrc
else
	ln -sf ~/dotfiles/.gemrc ~/.gemrc
fi
 