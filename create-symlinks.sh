#!/bin/bash


DOTFILES=
PLATFORM=$(uname -s)
if [ ${PLATFORM} == "Darwin" ]; then
  # macOS: requires port:coreutils
  if ! type "greadlink" > /dev/null; then
    echo "install greadlink using 'sudo port install coreutils'";
    exit 1
  fi
  DOTFILES=$(dirname $(greadlink -f $0))
elif [ ${PLATFORM} == "Linux" ]; then
  DOTFILES=$(dirname $(readlink -f $0))
fi

# TODO if the dotfiles or dotfiles folder already exists, move them to a
# backup location, otherwise it creates a symlink inside the existing
# folder.

# any OS
ln -fs $DOTFILES/git/gitconfig          ~/.gitconfig
ln -fs $DOTFILES/git/gitignore_global   ~/.gitignore_global
ln -fs $DOTFILES/screen/screenrc        ~/.screenrc
ln -fs $DOTFILES/vim/vimrc              ~/.vimrc

# Linux
if [ ${PLATFORM} == "Linux" ]; then
  if [ -f ~/.bashrc ]; then
      mv ~/.bashrc ~/.bashrc.bak
  fi

  if [ -f ~/.bash_profile ]; then
      mv ~/.bash_profile ~/.bash_profile.bak
  fi

  ln -fs $DOTFILES/bash/bashrc          ~/.bashrc
  ln -fs $DOTFILES/bash/bash_profile    ~/.bash_profile

# Darwin
elif [ ${PLATFORM} == "Darwin" ]; then
  ln -fs $DOTFILES/hammerspoon          ~/.hammerspoon
  ln -fs $DOTFILES/zsh/zshrc            ~/.zshrc
  ln -fs $DOTFILES/zsh/zshenv           ~/.zshenv
fi
