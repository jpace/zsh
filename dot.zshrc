# z shell rc
# -*- sh -*-

# search path for the cd command
cdpath=(~ ..)

path=(~/bin $path)

PROMPT2='> '
PROMPT3='+ '

# cool, but hard to get used to:
# RPROMPT="%~ %m %*"

# just the time
RPROMPT="%*"

PS1=$'%B%~%b%# '

## functions for displaying neat stuff in *term title
case $TERM in
    *xterm*|rxvt|(dt|k|E)term)
    ## display user@host and full dir in *term title
    precmd () {
        print -Pn  "\033]0;%n@%m %~\007"
    }
    ## display user@host and name of current process in *term title
    preexec () {
        print -Pn "\033]0;%n@%m <$1> %~\007"
    }
    ;;
esac

zshdir=~/System/Zsh

source ~zshdir/aliases.zsh
source ~zshdir/environment.zsh

if [[ x$HOST = xeddie ]] && [ -e ~zshdir/work.zsh ]; then
    source ~zshdir/work.zsh
else if [[ x$HOST = xcanopus ]] && [[ -e ~zshdir/home.zsh ]]; then
    source ~zshdir/home.zsh
fi
fi

setopt extendedglob

# Make home go to the beginning of the line; end to the end, etc.
if [[ $TERM = "xterm" || $TERM = "xterm-color" ]]; then
       export TERM='xterm-color'
       bindkey "\e[1~" beginning-of-line
       bindkey "\e[3~" delete-char 
       bindkey "\e[4~" end-of-line
       bindkey "\eOt" backward-char
       bindkey "\eOv" forward-char
       bindkey "\eOx" up-line-or-history
       bindkey "\eOw" down-line-or-history
       mesg n
fi

