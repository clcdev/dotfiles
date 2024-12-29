if test "$(tty)" = /dev/tty1 && uwsm check may-start
    exec uwsm start hyprland.desktop
end
