#!/usr/bin/zsh
# -*- sh-mode -*-

# the current file in Emacs:
alias ecf='em-current-file'

# the directory of the current file in Emacs (same as "ecf | xargs dirname"):
alias ecd='em-current-directory'

# the rootname of the current file in Emacs:
alias ecr='em-current-rootname'

# the basename of the current file in Emacs:
alias ecb='em-current-basename'

# changes to the directory of the current buffer in Emacs
# credit: http://chneukirchen.org/blog/archive/2015/02/10-fancy-zsh-tricks-you-may-not-know.html
cde () {
    cd `em-current-directory`
}

# create a java test for the current java source file
otest() {
    f=${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) buffer-file-name)' )}
    o $f:h:gs/main/test//Test$f:t
}

# This is a function instead of an alias, because "emacsclient --no-wait foo.rb bar.txt" only opens
# the first file.
alias ec='em-open'

# currently open file in Emacs:
alias -g E='`em-current-file`'
alias -g EF='`em-current-file`'

# directory of the current file
alias -g ED='`em-current-directory`'

# rootname of the current file
alias -g ER='`ecr`'

# basename of the current file
alias -g EB='`ecb`'

# compdef _em em
