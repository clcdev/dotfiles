fish_add_path -g ~/.local/bin

# Set XDG basedirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME; or set -gx XDG_STATE_HOME $HOME/.local/state
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME $HOME/.cache
for xdgdir in (path filter -vd $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME $XDG_CACHE_HOME)
    mkdir -p $xdgdir
end

# Set up our variables
set -q GITHUB_USERNAME; or set -gx GITHUB_USERNAME clcdev
set -q EDITOR; or set -gx EDITOR nvim
set -q SSH_ASKPASS; or set -gx SSH_ASKPASS $HOME/.local/bin/hypr-askpass
set -q SSH_ASKPASS_REQUIRE; or set -gx SSH_ASKPASS_REQUIRE prefer
set -q DOTFILES_GIT; or set -gx DOTFILES_GIT $HOME/.local/dotfiles-git

set -gx MANROFFOPT -c
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
