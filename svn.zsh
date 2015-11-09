#!/usr/bin/zsh
# -*- sh -*-

# alias sl15='svn log -l 15'
# alias sl='svn log -l 5'

alias sfcommit='svn commit -F /tmp/svncomment.txt '

alias sdff='svn diff --diff-cmd diff -x -bwB '
alias sdfj='svn diff --diff-cmd mockdiff'
alias svd='svn diff '
alias svndw="svn diff --diff-cmd diff -x -uw"
alias sll="svn log"
