#!/usr/bin/zsh -f
# -*- sh-mode -*-

# the directory of the current file in Emacs (same as "em current-file | xargs dirname"):
echo ${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) default-directory) ')}
