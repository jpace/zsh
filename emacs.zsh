#!/usr/bin/zsh
# -*- sh-mode -*-

# the current file in Emacs:
ecf() {
    echo ${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) buffer-file-name) ')}
}

# the directory of the current file in Emacs (same as "ecf | xargs dirname"):
ecd() {
    echo ${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) default-directory) ')}
}

# changes to the directory of the current buffer in Emacs
# credit: http://chneukirchen.org/blog/archive/2015/02/10-fancy-zsh-tricks-you-may-not-know.html
cde () {
    cd `ecd`
}

# create a java test for the current java source file
otest() {
    f=${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) buffer-file-name)' )}
    o $f:h:gs/main/test//Test$f:t
}

# This is a function instead of an alias, because "emacsclient --no-wait foo.rb bar.txt" only opens
# the first file.
ec() {
    for i in $*
    do
        emacsclient --no-wait $i
    done
}

ecn() {
    ffn=${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) buffer-file-name) ')}
    echo $ffn:t:r
}

# currently open file in Emacs:
alias -g E='`ecf`'
