#!/bin/sh -f
# -*- sh-mode -*-

# returns a list of the files currently in Emacs.

emacsclient -e '(mapcar (function buffer-file-name) (buffer-list))' | sed -e 's/^(//' -e 's/)$//' -e 's/ /\n/g' | sed -e '/^nil$/d' -e 's/^\"//' -e 's/\"$//'

