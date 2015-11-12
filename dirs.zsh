#!/usr/bin/zsh
# -*- sh -*--

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias pd='push d'
alias ret='popd'
alias dv='dirs -v'

# cd .... becomes cd ../../..
# from http://grml.org/zsh/zsh-lovers.html
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
# zle -N rationalise-dot
# bindkey . rationalise-dot

md() { mkdir $* && cd $* }

up() {
    dir=""
    if [ -z "$1" ]; then
        dir=..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
        dir=${PWD%/$1*/*}/$1*
    fi
    cd "$dir";
}

