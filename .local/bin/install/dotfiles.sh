#!/usr/bin/env bash

# Disable showing the untracked files in both git status and the bash/fish autocompletions while using dotfiles-git
dotfiles-git config --local status.showUntrackedFiles no
dotfiles-git config --local bash.showUntrackedFiles false
