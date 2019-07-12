#!/usr/bin/zsh
# -*- sh -*-

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

# alias fj="find . -name '*.java' | sort | xargs glark $*"
# alias fjsrc="find src/main/java -name '*.java' | sort | xargs glark $*"
# alias fjtst="find src/test/java -name '*.java' | sort | xargs glark $*"

alias fgra="find . -name '*gradle*' | sort | xargs glark $*"
alias fv="find . -name '*.groovy' | sort | xargs glark $*"

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

fjar () {
    find . -type f -name "$1*.jar"
}
