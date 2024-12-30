if test "$(tty)" = /dev/tty1 && command uwsm check may-start
    command clear
    exec uwsm start hyprland.desktop 1>/dev/null
end
