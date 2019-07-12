#!/bin/zsh
# -*- sh -*-

# s: search (grep)
# f: find
# l,d: list (dir)
# e: eyeball (view)
# o: open
# b: build

beseeker() {
    ext=$1
    shift
    grp=$1
    shift
    find \( -type d \( -name .git -o -name .svn -o -name staging -o name backup \) -prune \) \
        -o -type f -name "*$ext" -print0 | \
        sort -z | \
        xargs -0 $grp $*
}

beseekjarfiles() {
    beseeker ".jar" "glark --binary=list" $*
}

beseekzipfiles() {
    beseeker ".zip" "glark --binary=list" $*
}

beseekfiles() {
    local suffix=$1
    echo "suffix: $suffix" >&2
    shift
    grp=$((which glark >/dev/null) && echo "glark" || echo "grep")
    # echo find \( -type d \( -name .git -o -name .svn -o -name staging -o -name backup \) -prune \) -o -type f -name "*.$suffix" -print0 | sort -z | xargs -0 $grp $@ >&2
    find      \( -type d \( -name .git -o -name .svn -o -name staging -o -name backup \) -prune \) -o -type f -name "*.$suffix" -print0 | sort -z | xargs -0 $grp $@
}

s() {
    grp=$((which glark >/dev/null) && echo "glark" || echo "grep")
    for xx in "$@"
    do
	    echo xx: $xx :xx >&2
    done
    for final in $@; do :; done

    if [[ -f $final || -d $final ]]
    then
	    echo "running grep, since $final found as file or directory" >&2
	    grp=$((which glark >/dev/null) && echo "glark" || echo "grep")
	    $grp $*
	    return
    else
	    echo "1: '$1'" >&2
	    case "$1" in
            rb|r)
                shift
                f "rb" | xargs $grp $*
                ;;
            
            erb)
                shift
                f "erb" | xargs $grp $*
                ;;
            
            groovy|gv)
                shift
                f "groovy" | xargs $grp $*
                ;;
            
            gradle|gr)
                shift
                f "gradle" | xargs $grp $*
                ;;
            
            java|j)
                shift
                f "java" | xargs $grp $*
                ;;

            jar|J)
                shift
                beseekjarfiles $*
                ;;
            
            xml|x)
                shift
                f "xml" | xargs $grp $*
                ;;

            zip|Z|z)
                shift
                beseekzipfiles $*
                ;;
            
            .)
                shift
                f "." | xargs $grp $*
                ;;
            
            -s=*) 
                sfx=$1
                shift
                sfx=`echo $sfx | sed -re 's/^\-s=\.\?//'`
                echo $sfx
                beseekfiles $sfx $*
                ;;

            -s) 
                shift
                sfx=$1
                shift
                echo sfx $sfx
                sfx=`echo $sfx | sed -re 's/^\.//'`
                echo sfx: $sfx
                beseekfiles $sfx $*
                ;;

            *)
		        if [[ -f "build.gradle" || -f "build.xml" ]]
		        then
		            f "java" | xargs $grp $*
		        elif [ -f "Rakefile" ]
		        then
		            echo "rakefile exists" >&2
		            f "rb" | xargs $grp $*
		        else
		            echo "not handled: $1" >&2
		        fi
		        ;;
	    esac
    fi
}
