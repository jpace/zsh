#!/usr/bin/zsh
# -*- sh-mode -*-

echo ${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) buffer-file-name) ')}
