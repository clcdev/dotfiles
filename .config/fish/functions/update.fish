function update --wraps='paru -Syu' --description 'Runs system upgrade'
    command maybe-Sy paru -Syu $argv
end
