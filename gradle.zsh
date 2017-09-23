#!/usr/bin/zsh -f
# -*- sh-mode -*-

alias gct='gradle clean test --offline'
alias gr='gradle --offline'
alias gb='gradle build --offline'
alias gt='gradle test --offline'

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

# path=(/opt/org/gradle/gradle-4.0/bin $path)

optloc=/opt/gradle-3.4.1/bin
optorgloc=/opt/org/gradle/gradle-3.4.1/bin

if [ -e $optloc ]
then
    alias gradle=$optloc/gradle
elif [ -e $optorgloc ]
then
    alias gradle=$optorgloc/gradle
fi

echo "path: $path"
