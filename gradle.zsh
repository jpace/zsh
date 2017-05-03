# -*- sh -*-

alias gct='gradle clean test'
alias gr='gradle '
alias gb='gradle build'
alias gt='gradle test'

gst() { gradle test -Dtest.single=$* }

gtest() { f=`echo src/**/*.java(om[1])`; e=Test$f:gs/Test//:t:r; echo $e; gst $e }

path=($path /opt/gradle-3.4.1/bin)
