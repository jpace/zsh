#!/usr/bin/zsh
# -*- sh -*-

# Rake
alias rtu='rake test'
alias rti='rake test:integration'
alias rt='ruby -Itest -Itest/unit -Ilib'

# run the latest test
rtl() { f=`echo test/**/*_test.rb(om[1])`; echo file: $f; rt $f }

# run the test for the current file (poor man's guard)
rtc() {
    f=`ecf`
    echo file: $f
    t=$f:gs/lib/test/
    echo $t
    r=${t:gs/_test//:t:r}_test.rb
    p=$t:h/$r
    echo $p
    rt $p $*
}
