#!/usr/bin/zsh
# -*- sh -*-

# many old aliases (e.g., sl) these have rendered obsolete by 'pvn'.

alias sdff='svn diff --diff-cmd diff -x -bwB '
alias sdfj='svn diff --diff-cmd mockdiff'
alias sdf='svn diff '
alias svndw="svn diff --diff-cmd diff -x -uw"

alias sb-'svn blame -r HEAD'

alias svnci='svncommit /tmp/cmt'
