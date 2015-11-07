#!/usr/bin/zsh
# -*- sh -*-

# find shortcuts
# f() { find . -name $* | sort }

source_if_exists "find"

alias h='history -5000'
alias hg="history -5000 | egrep $*"

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

alias rt='rake test'
alias rv='rake TESTOPTS="-v"'

alias mt='make tests'
alias mk='make --no-print-directory'

alias t='cat'

source_if_exists "dirs"

alias grep='glark --grep'

alias -g XA=' | xargs'
alias -g XI=' | xargs -I'
alias -g X0=' | xargs -0'
alias -g XL=' | xargs ls -l'
alias -g XLS=' | xargs ls -lrta'

alias -g G='| glark'
alias -g XG='| xargs glark'

alias -g GG='| grep -3'
alias -g XGG='| xargs grep -3'

alias -g S='| sort'
alias -g SN='| sort -n'

alias -g L='| less'
alias -g M='| more'
alias -g H='| head'
alias -g T='| tail'

alias -g LN='| awk "{print FNR \" \" \$0 }"'

scrub () { find $* -type f \( -name '*~' -o -name '*.bak' ! \( -name flow.xml.bak \)  \) -print -exec rm -f {} \; }

# Find matching names, not going into .svn directories.
fn() { find . \( -name .svn -prune \) -o -name \*$*\* -print | sort }
fnn() { find . \( -name .svn -prune \) -o -name $* -print | sort }
ec() { for i in $*; do emacsclient --no-wait $i; done }

alias terms='konsole --geometry 175x75+5+5 --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark'

alias sz='source .zshrc'

alias rj='java_reformat.rb'

source_if_exists "svn"

# Gradle
alias gct='gradle clean test'
alias gr='gradle '
alias gb='gradle build'
alias gt='gradle test'

gst() { gradle test -Dtest.single=$* }

source_if_exists "git"

# Rake
alias rtu='rake test'
alias rti='rake test:integration'
alias rt='ruby -Itest -Itest/unit -Ilib'

alias rt19='ruby1.9.1 -Itest -Itest/unit -Ilib'
alias rake19='rake1.9.1'

gldeep() { glark $* *(.) */*(.) */*/*(.) */*/*/*(.) }

fjv() { for i in *(/); do find $i -name '*.java' | sort | xargs glark $*; done }

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

alias runeclipse=/opt/eclipse/eclipse

# todo:

# uberaliases:
# ee: eye: if dir, list (formerly sd), process files by type (jar, tar.gz, zip, image), i.e., shw
# xx: extract
# vv: verbose eye: if compressed files, extract (to stdout), for grepping
# oo: open: same as ec now

source_if_exists "ta"

alias psjava='ps auxw | grep java'
