#!/usr/bin/zsh -f
# -*- sh-mode -*-

alias gct='gradle clean test --offline'
alias gr='gradle --offline'
alias gb='gradle build --offline'
alias gt='gradle test --offline'
alias gct='gradle clean test build --offline'
alias gcb='gradle clean build'

gst() { gradle test --offline --tests $* }

gtest() {
    f=`echo src/**/*.java(om[1])`
    f=$f:r:s/src\/test\/java\//
    f=$f:r:s/src\/main\/java\//
    f=$f:gs/\//./
    f=$f:gs/Test//Test
    echo $f
    gst $f
}

optloc=/opt/gradle-3.4.1
optorgloc=/opt/org/gradle/gradle-3.4.1

for i in /opt/gradle-3.4.1 /opt/org/gradle/gradle-3.4.1
do
    p=$i/bin
    echo $p
    if [[ -e $p ]]
    then
        path=($p $path)
    fi
done
