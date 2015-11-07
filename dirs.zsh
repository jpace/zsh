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
zle -N rationalise-dot
bindkey . rationalise-dot

md() { mkdir $* && cd $* }

