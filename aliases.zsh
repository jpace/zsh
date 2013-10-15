#!/usr/bin/zsh
# -*- sh -*-

# find shortcuts
# f() { find . -name $* | sort }

ff () {
    local re
    
    if [[ -e 'Rakefile' ]]; then
	re='.*.rb$'
    elif [[ -e 'build.xml' || -e 'build.gradle' ]]; then
	re='.*.java$'
    elif [[ -e 'config.ru' ]]; then
	re='.*.e?rb$'
    else
	re='.*'
    fi
    find . -regex ${re} | sort
}

fx () {
    ff | xargs glark $*
}

# alias f='find . \( \( -name .svn -o -name .git \) -prune \) -o -name '

f () {
    find . \( \( -name .svn -o -name .git \) -prune \) -o -name $* -print
}

alias fj="find . -name '*.java' | sort | xargs glark $*"
alias fjsrc="find src/main/java -name '*.java' | sort | xargs glark $*"
alias fjtst="find src/test/java -name '*.java' | sort | xargs glark $*"

alias ft="find . -name '*.txt' | sort | xargs glark $*"
alias fr="find . \( -name pkg -prune \) -o \( -name '*.*rb' -print \) | sort | xargs glark $*"
alias fbx="find . -name 'build*.xml' | sort | xargs glark $*"
alias fxml="find . -name '*.xml' | sort | xargs glark $*"

alias frlib="find lib -name '*.rb' | sort | xargs glark $*"
alias frtest="find test -name '*.rb' | sort | xargs glark $*"
alias frtu="find test/unit -name '*.rb' | sort | xargs glark $*"
alias frti="find test/integration -name '*.rb' | sort | xargs glark $*"

# C++ files
alias fc="find . \( -name '*.h' -o -name '*.cpp' -o -name '*.c' -o -name '*.cc' -o -name '*.y' -o -name '*.l' \) | xargs glark $*"
alias fcm="find . \( -name '*.h' -o -name '*.cpp' -o -name '*.c' -o -name '*.cc' -o -name '*.y' -o -name '*.l' \) | xargs glark -M $*"
alias fcco="find . \( -name '*.h' -o -name '*.cpp' \) -perm -600"

alias fall="find . \( \( -name .svn -o -name .git \) -prune \) -o -type f -print0 | xargs -0 glark $*"

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

alias c='clear'
alias a='alias'
alias cx='chmod +x'
alias crw='chmod ag+w -R .'

alias rt='rake test'
alias mt='make tests'
alias mk='make --no-print-directory'

alias t='cat'
alias .='ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias pd='push d'
alias ret='popd'
alias dv='dirs -v'

alias grep='glark --grep'

alias -g XA=' | xargs'
alias -g XI=' | xargs -I '

alias -g G='| glark'
alias -g XG='| xargs glark'

alias -g S='| sort'
alias -g SN='| sort -n'

alias -g L='| less'
alias -g M='| more'
alias -g H='| head'
alias -g T='| tail'

alias syncp4='p4 sync ...'
alias peekp4='p4 sync -n ...'

alias svndw="svn diff --diff-cmd diff -x -uw"

scrub () { find $* -type f \( -name '*~' -o -name '*.bak' ! \( -name flow.xml.bak \)  \) -print -exec rm -f {} \; }

# Find matching names, not going into .svn directories.
fn() { find . \( -name .svn -prune \) -o -name $* -print | sort }

alias terms='gnome-terminal --geometry 175x75+5+5 --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark'

alias sz='source .zshrc'

alias rj='java_reformat.rb'

# Subversion
alias sl='svn log -l 5'
alias sl15='svn log -l 15'
alias sdfj='svn diff --diff-cmd mockdiff'
alias sfcommit='svn commit -F /tmp/svncomment.txt '
alias svd='svn diff '
alias sdff='svn diff --diff-cmd diff -x -bwB '

# Gradle
alias gct='gradle clean test'
alias gr='gradle '
alias gb='gradle build'
alias gt='gradle test'

gst() { gradle test -Dtest.single=$* }

# Git
alias gitdfs='git diff --stat HEAD'
alias gitst='git status'

alias gitpullall='git pull origin master; git submodule foreach git pull origin master'
alias gitpushall='git push -u origin master; git submodule foreach git push -u origin master'
alias gpa='gitpushall'
alias gpull='gitpullall'
alias gpom='git push -u origin master'

# Rake
alias rtu='rake test'
alias rti='rake test:integration'
alias rt='ruby -Itest -Itest/unit -Ilib'

alias rt19='ruby1.9.1 -Itest -Itest/unit -Ilib'
alias rake19='rake1.9.1'

md() { mkdir $* && cd $* }

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
        dir=${PWD%/$1/*}/$1
    fi
    cd "$dir";
}
