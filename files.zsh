#!/usr/bin/zsh
# -*- sh-mode -*-

# taken from http://chneukirchen.org/dotfiles/.zshrc

imv() {
    local src dst
    for src
    do
        [[ -e $src ]] || { print -u2 "$src does not exist"; continue }
        dst=$src
        vared -p ">> " dst
        if [[ $src = $dst ]]
        then
            print -u2 "$src and $dst are identical"
        else
            mkdir -p $dst:h && mv -n $src $dst
        fi
    done
}

# from http://chneukirchen.org/dotfiles/.zshrc
# displays the full path of the file, or pwd if nothing specified
path() {
  print -l ${${@:-$PWD}:a}
}

scrub () {
    find $* -type f \( -name '*~' -o -name '*.bak' ! \( -name flow.xml.bak \)  \) -print -exec rm -f {} \;
}

# Find matching names, not going into .svn directories.
fn() {
    find . \( -name .svn -prune \) -o -name \*$*\* -print | sort
}

fnn() {
    find . \( -name .svn -prune \) -o -name $* -print | sort
}

# most recent directory and file:
alias -g D='*(/om[1])'
alias -g F='*(.om[1])'

alias cx='chmod +x'
alias crw='chmod ag+w -R .'
