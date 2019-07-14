#!/bin/sh
# -*- sh-mode -*-

# "emacsclient --no-wait foo.rb bar.txt" only opens the first file.

for i in $*
do
    emacsclient --no-wait $i
done
