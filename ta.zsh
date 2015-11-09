# see http://www.focusonzsh.org/2015/08/caching-command-output.html

alias -g TA='| tee /tmp/cmdoutput | cat -n' 

ta() { 
    arg=$1
    cmdout=/tmp/cmdoutput
    if [ -z "$arg" ]
    then
	tail -1 $cmdout
    else
	a=(${(s.:.)arg})
	first=$a[1]
	second=$a[2]
	if [ -z $second ]
	then
	    tail -n +$first $cmdout | head -1
	elif [[ $second[1] = "-" ]]
	then
	    cmd="{print \$(NF + 1 + $second)}"
	    tail -n +$first $cmdout | head -1 | awk "$cmd"
	else
	    cmd="{print \$$second}"
	    tail -n +$first $cmdout | head -1 | awk "$cmd"
	fi
    fi
}
