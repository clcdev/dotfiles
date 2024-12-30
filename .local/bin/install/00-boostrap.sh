#!/usr/bin/env bash

BRANCH=$1
DOTFILES_GIT="$HOME/.local/dotfiles-git"

if [ -d "$DOTFILES_GIT" ]; then
  echo "dotfiles seems to already be bootstrapped!"
  exit 1
fi

if [ -z "$BRANCH" ]; then
  echo "Specify a branch to bootstrap"
  exit 1
fi

git clone --bare -b "$BRANCH" -- https://github.com/clcdev/dotfiles $DOTFILES_GIT \
  || (echo "git clone failed! Aborting"; exit 1)
function dotfiles-git {
   git --git-dir=$DOTFILES_GIT --work-tree=$HOME $@
}
dotfiles-git checkout
if [ $? = 0 ]; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dot files."
  mkdir -p $HOME/.config-backup
  dotfiles-git checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{}
  dotfiles-git checkout
fi

# Disable showing the untracked files in both git status and the bash/fish autocompletions while using dotfiles-git
dotfiles-git config --local status.showUntrackedFiles no
dotfiles-git config --local bash.showUntrackedFiles false
