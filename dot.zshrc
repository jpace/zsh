# z shell rc
# -*- sh -*-

# search path for the cd command
cdpath=(~ ..)

path=(~/bin $path)

setopt promptsubst

fpath=(~/lib/zsh ~/System/Zsh $fpath)
autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U colors && colors

setopt prompt_subst

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    svn info >/dev/null 2>/dev/null && echo '☿' && return
    echo ' '
}

function git_branch {
    git symbolic-ref --short HEAD
    # echo branch
}

PROMPT2='> '
PROMPT3='+ '

# cool, but hard to get used to:
# RPROMPT="%~ %m %*"

# just the time
RPROMPT="$(git_branch)%*"

# PROMPT=$'%B%~%b$(prompt_char)%# '

# get the name of the branch we are on
git_prompt_info() { 
    git branch | awk '/^\*/ { print $2 }'
}
get_git_dirty() { 
    git diff --quiet || echo '*'
}

PROMPT="%{$fg[blue]%}%c %{$fg_bold[red]%}$(git_branch)$(get_git_dirty)%{$fg[blue]%} $ %{$reset_color%}"

# RPROMPT="%{$bg[green]%}$(git_branch)%{$reset_color%}"
RPROMPT="%F{2}$(git_branch)%%f"

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
export TERM=xterm-256color

source ~/bin/jdk 1.6

# RVM needs to be first in the path
PATH=~/.rvm/gems/ruby-2.0.0-p247/bin:$PATH

zstyle ':prompt:ganneff' colors true
# I can't get this to work; right prompt is still printed:
# zstyle ':prompt:ganneff:right:setup' use-rprompt false

source ~zshdir/prompt_ganneff_setup

[[ $EMACS = t ]] && unsetopt zle

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
