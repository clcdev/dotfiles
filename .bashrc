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

alias p='maybe-Sy paru'
alias update='maybe-Sy paru -Syu'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hx='helix'
alias dotfiles-git='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dotfiles-lazy='/usr/bin/lazygit -g $HOME/dotfiles/ -w $HOME'

PS1='[\u@\h \W]\$ '
