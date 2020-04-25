# z shell rc
# -*- sh -*-

# search path for the cd command
cdpath=(~ ..)

setopt promptsubst

SRC=${(%):-%N}
while [ -h "$SRC" ]; do
  DIR="$( cd -P "$( dirname "$SRC" )" && pwd )"
  SRC="$(readlink "$SRC")"
  [[ $SRC != /* ]] && SRC="$DIR/$SRC"
done
DOTFILES_DIR="$( cd -P "$( dirname "$SRC" )" && pwd )"

hash -d zshdir=$DOTFILES_DIR

path=(~zshdir/bin $path)
for i in ~zshdir/bin/*(/)
do
    path=($i $path)
done

path=(~zshdir/bin ~/bin $path)

fpath=(~zshdir $fpath)

autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U colors && colors

setopt prompt_subst

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

source_if_exists() {
    echo -n "seeking $1 ... "
    fname=~zshdir/$1.zsh
    if [[ -e $fname ]]
    then
	    echo "found $1"
	    source $fname
    else
	    echo "did not find $1"
    fi
}

source_if_exists "aliases"
source_if_exists "dirs"
source_if_exists "emacs"
source_if_exists "environment"
source_if_exists "files"
source_if_exists "find"
source_if_exists "git"
source_if_exists "glark"
source_if_exists "gradle"
source_if_exists "help"
source_if_exists "java"
source_if_exists "pvn"
source_if_exists "rails"
source_if_exists "ruby"
source_if_exists "svn"
source_if_exists "ta"

if [[ x$HOST = xeddie ]]
then
    source_if_exists "work"
elif [[ x$HOST = xdubhe || HOST = xcanopus ]]
then
    source_if_exists "home"
fi

source_if_exists $HOST

setopt extendedglob

# Make home go to the beginning of the line; end to the end, etc.
if [[ $TERM = "xterm" || $TERM = "xterm-color" ]]
then
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
export TERM=xterm-256color

zstyle ':prompt:ganneff' colors true

source ~zshdir/prompt_ganneff_setup

[[ $EMACS = t ]] && unsetopt zle

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# when logging in via Putty:
if [[ $LC_CONNFROM = "one" ]]
then
    cd ~is
elif [[ $LC_CONNFROM = "two" ]]
then
    cd tmp; emacs -nw
elif [[ $LC_CONNFROM = "three" ]]
then
    cd ~sag
fi

if [[ -e ~/.rvm/scripts/rvm ]]
then
    source ~/.rvm/scripts/rvm
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
    rvm use 2.3
fi
