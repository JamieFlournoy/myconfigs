#!/bin/bash

cd ~/

function install_file {
  BASENAME=$1
  ORIG=".${BASENAME}_orig"
  DOTFILE=".${BASENAME}"
  SOURCE="~/myconfigs/dot_${BASENAME}"
  echo "Preserving '$DOTFILE' as '$ORIG'"
  /bin/mv "$DOTFILE" "$ORIG"
  echo "Symlinking '$SOURCE' as '$DOTFILE'"
  /bin/ln -s "$SOURCE" "$DOTFILE"
}

install_file bashrc
install_file emacs
install_file gitconfig
install_file gitignore
install_file screenrc



