#!/usr/bin/env bash

config="$HOME/.config/fuzzel/power-menu.ini"

actions=$(echo -e "  Lock\n  Shutdown\n  Reboot\n  Suspend\n  Logout")

# Display logout menu
selected_option=$(echo -e "$actions" | fuzzel --dmenu --lines=5 --config="${config}")

# Perform actions based on the selected option
case "$selected_option" in
*Lock)
  hyprlock
  ;;
*Shutdown)
  systemctl poweroff
  ;;
*Reboot)
  systemctl reboot
  ;;
*Suspend)
  systemctl suspend
  ;;
*Logout)
  hyprctl dispatch exit 0
  ;;
esac
