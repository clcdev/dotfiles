alias dotfiles-git='/usr/bin/git --git-dir=$DOTFILES_GIT --work-tree=$HOME'
alias dotfiles-lazy='/usr/bin/lazygit -g $DOTFILES_GIT -w $HOME'
alias recentpac="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
