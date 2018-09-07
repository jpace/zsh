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
