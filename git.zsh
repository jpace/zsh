#!/usr/bin/zsh
# -*- sh -*-

alias gitdfs='git diff --stat HEAD'
alias gitst='git status'

alias gitpullall='git pull origin master; git submodule foreach git pull origin master'
alias gitpushall='git push -u origin master; git submodule foreach git push -u origin master'
alias gpa='gitpushall'
alias gpull='gitpullall'
alias gpom='git push -u origin master'
