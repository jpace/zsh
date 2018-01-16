#!/usr/bin/zsh
# -*- sh-mode -*-

# the current file in Emacs:
alias ecf='em-current-file'
alias -g E='`em-current-file`'
alias -g EF='`em-current-file`'

# the directory of the current file in Emacs (same as "ecf | xargs dirname"):
alias ecd='em-current-directory'
alias -g ED='`em-current-directory`'

# the rootname of the current file in Emacs:
alias ecr='em-current-rootname'
alias -g ER='`em-current-rootname`'

# the basename of the current file in Emacs:
alias ecb='em-current-basename'
alias -g EB='`em-current-basename`'

# current Java file converted to a class name (org.incava.Foo)
alias ecjc='em-current-java-classname'
alias -g EJC='`em-current-java-classname`'

alias -g EJT='`em-current-java-test`'

# changes to the directory of the current buffer in Emacs
# credit: http://chneukirchen.org/blog/archive/2015/02/10-fancy-zsh-tricks-you-may-not-know.html
cde () {
    cd `em-current-directory`
}

# create a java test for the current java source file
otest() {
    f=${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) buffer-file-name)' )}
    em-open $f:h:gs/main/test//Test$f:t
}

alias ec='em-open'
