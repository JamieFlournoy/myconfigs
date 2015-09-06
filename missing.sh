#!/bin/bash

# Identify missing things that I like that a system should have
# installed on it.

if [[ -z `type -t check_installed_emacs` ]]; then
    . ~/myconfigs/functions
fi

check_installed_emacs
check_installed_git_completion
