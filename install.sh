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
install_copy gitconfig
install_symlink gitignore
install_symlink screenrc
install_symlink tmux.conf
