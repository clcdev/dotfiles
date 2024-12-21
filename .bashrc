#
# ~/.bashrc
#

export PATH="$HOME/.local/bin:$PATH"
export GITHUB_USERNAME="clcdev"
export EDITOR="helix"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ "$(tty)" == "/dev/tty1" ]] && uwsm check may-start; then
    exec uwsm start hyprland.desktop &>> ~/.config/hypr/last.log
fi

_maybeRefresh() {
    local syncFile="/run/user/1000/last_pacman_sync"
    if [ "$1" ] || [ ! -e "$syncFile" ] || [ "$(find $syncFile -mmin +60)" ] ; then
        touch "$syncFile"
        paru -Sy
    fi
}

alias p='_maybeRefresh && paru'
alias pS='_maybeRefresh && paru -S'
alias update='_maybeRefresh always && paru -Su'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hx='helix'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '
