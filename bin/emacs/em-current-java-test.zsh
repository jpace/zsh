#!/usr/bin/zsh
# -*- sh-mode -*-

name=`em current-java-classname`
if [ $? -eq 0 ]
then
    name=${name:s/Test//}Test
    echo $name
else
    exit $?
fi
