#!/bin/sh
# -*- sh-mode -*-

name=`em current-file`
if [[ $name:e == "java" ]]
then
    name=`echo $name:r | sed -r -e 's/.*(org|com)\//\1\//' | tr '/' '.'`
    echo $name
    
else
    echo not a Java file: $name
    exit 1
fi
