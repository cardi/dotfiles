#!/bin/bash

# requires port:coreutils
DOTFILES=$(dirname $(greadlink -f $0))

# TODO if the dotfiles exist, move them to a backup location
ln -s $DOTFILES/git/gitconfig        ~/.gitconfig
ln -s $DOTFILES/git/gitignore_global ~/.gitignore_global
ln -s $DOTFILES/hammerspoon          ~/.hammerspoon
ln -s $DOTFILES/screen/screenrc      ~/.screenrc
ln -s $DOTFILES/vim/vimrc            ~/.vimrc

ln -s $DOTFILES/zsh/zshrc            ~/.zshrc
ln -s $DOTFILES/zsh/zshenv           ~/.zshenv
