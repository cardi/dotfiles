#!/bin/bash

# requires port:coreutils
DOTFILES=$(dirname $(greadlink -f $0))

# TODO if the dotfiles or dotfiles folder already exists, move them to a
# backup location, otherwise it creates a symlink inside the existing
# folder.
ln -fs $DOTFILES/git/gitconfig        ~/.gitconfig
ln -fs $DOTFILES/git/gitignore_global ~/.gitignore_global
ln -fs $DOTFILES/hammerspoon          ~/.hammerspoon
ln -fs $DOTFILES/screen/screenrc      ~/.screenrc
ln -fs $DOTFILES/vim/vimrc            ~/.vimrc

ln -fs $DOTFILES/zsh/zshrc            ~/.zshrc
ln -fs $DOTFILES/zsh/zshenv           ~/.zshenv
