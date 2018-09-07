#!/usr/bin/zsh -f
# -*- sh-mode -*-

glamacs() {
    emfiles | grep -v ".emacs.desktop" | xargs glark $*
}
