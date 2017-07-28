#!/usr/bin/zsh
# -*- sh -*-

export GRADLE_HOME=/opt/gradle-1.12
export GROOVY_HOME=/usr/share/groovy2

for i in /opt/org/incava/*
do
    n=$i:t
    hash -d $n=$i
done
