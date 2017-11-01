#!/bin/sh -f

for i in $*
do
    echo $i
    case $i in
        *.zip|*.jar) 
        for ii in `unzip -l $i | grep '\.class$' | cut -c31-`
        do
            l=`unzip -qca $* $ii | xxd | head -1 | cut -c26-29`
            echo 1.$(( 0x$l * 1 - 44 )) "\t" $ii
        done 
        ;;
        *.class)
            l=`xxd $i | head -1 | cut -c26-29`
            # echo "l: $l"
            echo 1.$(( 0x$l * 1 - 44 )) "\t" $ii
            ;;
    esac
done
