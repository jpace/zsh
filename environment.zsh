#!/usr/bin/zsh
# -*- sh -*-

export PERL5LIB=~/lib/perl5
export RUBYLIB=~/lib/ruby:~/Libraries/ruby

# don't put repeated commands in the history:
export HISTCONTROL=ignoredups

export LD_LIBRARY_PATH=/usr/local/lib:.

# eval `dircolors ~/.dircolorsrc`
export ZLS_COLORS=$LS_COLORS

# need 2 ctrl-D's to quit
export IGNOREEOF=2

# default places to look while cd'ing
export CDPATH=.:..

export HISTFILE=~/.zsh_history
export SAVEHIST=3000
export HISTSIZE=1000

setopt APPEND_HISTORY
setopt HISTIGNOREDUPS
setopt IGNORE_EOF

export NPX_PLUGIN_PATH=$JAVA_HOME/jre/bin

export ANT_OPTS="-Xms1g -Xmx2g"
export LESSOPEN="|lesspipe.sh %s"
export TZ="US/Eastern"

# omit '/' from chars; thus ctrl-w kills back to next element if at the end of a path
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

setopt HIST_IGNORE_SPACE

