#!/usr/bin/zsh
# -*- sh -*-

# changes to the directory of the current buffer in Emacs
# credit: http://chneukirchen.org/blog/archive/2015/02/10-fancy-zsh-tricks-you-may-not-know.html
cde () {
    cd ${(Q)~$(emacsclient -e '(with-current-buffer
                               (window-buffer (selected-window))
                               default-directory) ')}
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
