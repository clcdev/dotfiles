function dotfiles-pacman
    set -l pkglist "$HOME/.local/bin/install/pac.lst"
    mkdir -p (dirname $pkglist)
    touch $pkglist
    switch $argv[1]
        case add
            string join \n $argv[2..] | cat - $pkglist | sort -u - | sponge $pkglist
        case remove rem delete del
            string join \n $argv[2..] | comm -13 - $pkglist | sort -u - | sponge $pkglist
        case '*'
            echo "Error, $argv[1] is not a valid option" 1>&2
            return 1
    end
end
