#!/bin/bash

# Identify missing things that I like that a system should have
# installed on it.

emacs_version=$(emacs --version | head -1 | colrm 1 10)
emacs_major_version=$(echo $emacs_version | colrm 3)
echo "Found emacs version:" $emacs_version
echo "Found emacs major version:" $emacs_major_version

if [[ $emacs_major_version -lt 24 ]]; then
    echo "The installed Emacs is older than version 24."
    echo "On MacOS X:"
    echo "    brew update"
    echo "    brew install emacs --with-cocoa"
    echo
    echo "On Ubuntu:"
    echo "    sudo apt-get update"
    echo "    sudo apt-get install emacs24"

fi
