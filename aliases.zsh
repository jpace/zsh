#!/usr/bin/zsh
# -*- sh -*-

# find shortcuts
alias f='find . -name | sort'
alias ff='find . -type f -name | sort'
alias fj="find . -name '*.java' | sort | xargs glark $*"
alias fjsrc="find src/main/java -name '*.java' | sort | xargs glark $*"
alias fjtst="find src/test/java -name '*.java' | sort | xargs glark $*"

alias ft="find . -name '*.txt' | sort | xargs glark $*"
alias fr="find . \( -name pkg -prune \) -o \( -name '*.*rb' -print \) | sort | xargs glark $*"
alias fx="find . -name '*.xml' | sort | xargs glark $*"
alias fbx="find . -name 'build*.xml' | sort | xargs glark $*"
alias fxml="find . -name '*.xml' | sort | xargs glark $*"
alias fjmd="find ~jmet ~jass ~jmtest ~svrmd -name '*.java' | sort | xargs glark $*"

alias frlib="find lib -name '*.rb' | sort | xargs glark $*"
alias frtest="find test -name '*.rb' | sort | xargs glark $*"
alias frtu="find test/unit -name '*.rb' | sort | xargs glark $*"
alias frti="find test/integration -name '*.rb' | sort | xargs glark $*"

# C++ files
alias fc="find . \( -name '*.h' -o -name '*.cpp' -o -name '*.c' -o -name '*.cc' -o -name '*.y' -o -name '*.l' \) | xargs glark $*"
alias fcm="find . \( -name '*.h' -o -name '*.cpp' -o -name '*.c' -o -name '*.cc' -o -name '*.y' -o -name '*.l' \) | xargs glark -M $*"
alias fcco="find . \( -name '*.h' -o -name '*.cpp' \) -perm -600"

alias fall="find . \( -name .svn -prune \) -o -type f -print0 | sort | xargs -0 glark $*"

alias h='history -5000'
alias hg="history -5000 | egrep $*"

alias tidy="find . -name '*.class' -print -exec rm {} \;"

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

alias grep='glark --grep'
alias -g G='| glark'
alias -g XG='| xargs glark'

alias syncp4='p4 sync ...'
alias peekp4='p4 sync -n ...'

alias svndw="svn diff --diff-cmd diff -x -uw"

scrub () { find $* -type f \( -name '*~' -o -name '*.bak' \) -print -exec rm -f {} \; }
fn() { find . \( -name .svn -prune \) -o -name $* -print | sort }

alias terms='gnome-terminal --geometry 175x75+5+5 --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark --tab-with-profile=dark'

alias gct='gradle clean test'
alias gr='gradle '
alias gb='gradle build'
alias gt='gradle test'

gst() { gradle test -Dtest.single=$* }

alias gitdfs='git diff --stat HEAD'
alias gitst='git status'

alias gitpullall='git pull origin master; git submodule foreach git pull origin master'
alias gitpushall='git push -u origin master; git submodule foreach git push -u origin master'

alias gpom='git push -u origin master'

alias sl='svn log -l 5'

alias rtu='rake test'
alias rti='rake test:integration'
alias rt='ruby -Itest -Itest/unit -Ilib'
