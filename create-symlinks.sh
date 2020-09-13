#!/bin/sh

DOTFILES=$HOME/dotfiles

# TODO if the dotfiles exist, move them to a backup location

# hammerspoon
ln -s $DOTFILES/hammerspoon ~/.hammerspoon

# ssh
ln -s $DOTFILES/ssh ~/.ssh
