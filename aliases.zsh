#!/usr/bin/zsh
# -*- sh -*-

alias h='history -5000'
alias hg='history -5000 | grep'
alias hgg='history -5000 | glark'

alias zap='rm -i'

alias ls='ls -CF --color=tty'
alias ll='ls -l'
alias l='ls -CF'
alias la='ls -aCF'
alias sd='ls -alF'
alias sd='ls -alF --sort=version'
alias sdd='ls -alFd'
alias lslr='ls -lrta'
alias sdr='ls -lrta'
alias sds='ls -lta'
alias sr='ls -lrta'

alias c='clear'
alias a='alias'

alias -g XA=' | xargs'
alias -g XI=' | xargs -I'
alias -g X0=' | xargs -0'
alias -g XL=' | xargs ls -l'
alias -g XLS=' | xargs ls -lrta'

alias -g S='| sort'
alias -g SN='| sort -n'

# -R: display ANSI colors, not escaped codes:
alias -g L='| less -R'
alias -g M='| more'
alias -g H='| head'
alias -g T='| tail'
alias -g LN='| awk "{print FNR \" \" \$0 }"'

alias -g J='jpace'

# returns the most recent file within a project, appropriate to the project
alias -g R='`find_recent`'

alias sz='source .zshrc'

# todo:

# uberaliases:
# ee: eye: if dir, list (formerly sd), process files by type (jar, tar.gz, zip, image), i.e., shw
# xx: extract
# vv: verbose eye: if compressed files, extract (to stdout), for grepping
# oo: open: same as ec now

source_if_exists "ta"

t() { runtest $* }

alias rmcolors="perl -pe 's/\[\d+m//g'"
alias zapcolors="perl -pi -e 's/\[\d+m//g'"

alias tt='runtest'
