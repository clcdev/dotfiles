#!/usr/bin/env bash

LOCAL_BIN=$HOME/.local/bin

which paru > /dev/null || pacman -S paru || (echo "paru required for install script to get aur packages"; exit 1)

$LOCAL_BIN/dotfiles-pacman-install || (echo "packages install failed"; exit 1)

systemctl --user enable --now ssh-agent
systemctl --user enable --now hypridle
[[ "$SHELL" =~ "fish" ]] || chsh -s /usr/bin/fish
