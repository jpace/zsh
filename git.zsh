#!/usr/bin/zsh
# -*- sh -*-

alias gitdfs='git diff --stat HEAD'
alias gitst='git status'

alias gitpullall='git pull origin master; git submodule foreach git pull origin master'
alias gitpushall='git push -u origin master; git submodule foreach git push -u origin master'
alias gpa='gitpushall'
alias gpull='gitpullall'
alias gpom='git push -u origin master'

alias gtpu='git push'
alias gtpl='git pull'

alias gtst='git status'
alias gtsts='git status --short'

alias gtbr='git branch'
alias gtco='git checkout'
alias gtcob='git checkout -b'
alias gtcom='git checkout master'
alias gtmg='git merge'

alias gtlog='git log'
alias gtlogp='git log -p'
alias gtlogno='git log --name-only'
alias gtlogst='git log --name-status'

alias gtdiff='git diff'
alias gtdiffstg='git diff --staged'
