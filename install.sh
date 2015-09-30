#!/bin/bash

cd

function quit_unless_file_exists {
    if [ ! -f $1 ]; then
	echo "Source file '${1}' not found - cannot be installed."
	exit 1
    fi
}

function preserve_file_if_exists {
    FILE="${1}"
    SAVE="${1}_orig"
    if [ -f "${FILE}" ]; then
	echo "Preserving existing '${FILE}' as '${SAVE}'"
	/bin/mv "${FILE}" "${SAVE}"
    fi
}

function install_symlink {
    SOURCE="${HOME}/myconfigs/dot_${1}"
    quit_unless_file_exists "${SOURCE}"
    DOTFILE=".${1}"
    preserve_file_if_exists ".${1}"
    echo "Symlinking '${SOURCE}' as '${DOTFILE}'"
    /bin/ln -s "${SOURCE}" "${DOTFILE}"
}

function install_copy {
    SOURCE="${HOME}/myconfigs/dot_${1}"
    quit_unless_file_exists "${SOURCE}"
    DOTFILE=".${1}"
    preserve_file_if_exists ".${1}"
    echo "Copying '${SOURCE}' to '${DOTFILE}'"
    /bin/cp "${SOURCE}" "${DOTFILE}"
}

install_symlink bashrc
install_symlink emacs

if [[ `uname` == 'Darwin' ]]; then
    install_copy gitconfig_mac
    preserve_file_if_exists $HOME/.gitconfig
    echo 'Renaming ~/.gitconfig_mac to ~/.gitconfig'
    /bin/mv $HOME/.gitconfig_mac $HOME/.gitconfig
else
    install_copy gitconfig
fi

install_symlink gitignore
install_symlink screenrc
install_symlink tmux.conf
install_symlink bash_aliases
install_symlink bash_profile
