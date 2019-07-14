#!/bin/sh
# -*- sh-mode -*-

em-files | grep -v ".emacs.desktop" | xargs glark $*
