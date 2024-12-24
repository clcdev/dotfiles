#
# ~/.bashrc
#

export PATH="$HOME/.local/bin:$PATH"
export GITHUB_USERNAME="clcdev"
export EDITOR="helix"
export SSH_ASKPASS="$HOME/.local/bin/hypr-askpass"
export SSH_ASKPASS_REQUIRE=prefer

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ "$(tty)" == "/dev/tty1" ]] && uwsm check may-start; then
    exec uwsm start hyprland.desktop
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
alias dotfiles-git='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dotfiles-lazy='/usr/bin/lazygit -g $HOME/dotfiles/ -w $HOME'

PS1='[\u@\h \W]\$ '
