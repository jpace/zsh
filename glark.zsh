#!/usr/bin/zsh -f
# -*- sh-mode -*-

glamacs() {
    emfiles | grep -v ".emacs.desktop" | xargs glark $*
}

alias grep='glark --grep'

alias -g GG='| glark'
alias -g XGG='| xargs glark'
alias -g G='| grep'
alias -g XG='| xargs grep'
