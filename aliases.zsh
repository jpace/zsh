#!/usr/bin/zsh
# -*- sh -*-

# find shortcuts
# f() { find . -name $* | sort }

source_if_exists "find"

alias h='history -5000'
alias hg='history -5000 | egrep'

alias zap='rm -i'

alias ls='ls -CF --color=tty'
alias ll='ls -l'
alias l='ls -CF'
alias la='ls -aCF'
alias sd='ls -alF'
alias sdd='ls -alFd'
alias lslr='ls -lrta'
alias sdr='ls -lrta'
alias sds='ls -lta'
alias sr='ls -lrta'

alias c='clear'
alias a='alias'
alias cx='chmod +x'
alias crw='chmod ag+w -R .'

alias mt='make tests'
alias mk='make --no-print-directory'

source_if_exists "dirs"

alias grep='glark --grep'

alias -g XA=' | xargs'
alias -g XI=' | xargs -I'
alias -g X0=' | xargs -0'
alias -g XL=' | xargs ls -l'
alias -g XLS=' | xargs ls -lrta'

alias -g GG='| glark'
alias -g XGG='| xargs glark'
alias -g G='| grep'
alias -g XG='| xargs grep'

alias -g S='| sort'
alias -g SN='| sort -n'

# -R: display ANSI colors, not escaped codes:
alias -g L='| less -R'
alias -g M='| more'
alias -g H='| head'
alias -g T='| tail'
alias -g LN='| awk "{print FNR \" \" \$0 }"'

# most recent directory and file

alias -g D='*(/om[1])'
alias -g F='*(.om[1])'

scrub () { find $* -type f \( -name '*~' -o -name '*.bak' ! \( -name flow.xml.bak \)  \) -print -exec rm -f {} \; }

# Find matching names, not going into .svn directories.
fn() { find . \( -name .svn -prune \) -o -name \*$*\* -print | sort }
fnn() { find . \( -name .svn -prune \) -o -name $* -print | sort }

alias sz='source .zshrc'

alias rj='java_reformat.rb'

source_if_exists "svn"
source_if_exists "gradle"
source_if_exists "git"
source_if_exists "ruby"

alias runeclipse=/opt/eclipse/eclipse

# todo:

# uberaliases:
# ee: eye: if dir, list (formerly sd), process files by type (jar, tar.gz, zip, image), i.e., shw
# xx: extract
# vv: verbose eye: if compressed files, extract (to stdout), for grepping
# oo: open: same as ec now

source_if_exists "ta"

alias psjava='ps auxw | grep java'

t() { runtest $* }
