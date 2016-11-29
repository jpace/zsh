# -*- sh -*-

alias gct='gradle clean test'
alias gr='gradle '
alias gb='gradle build'
alias gt='gradle test'

gst() { gradle test -Dtest.single=$* }
