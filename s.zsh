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
    echo "suffix: $suffix"
    shift
    grp=$((which glark >/dev/null) && echo "glark" || echo "grep")
    skipcmd="-name .git -o -name .svn -o -name staging -o -name backup"
    echo "skipcmd: $skipcmd"
    echo find \( -type d \( -name .git -o -name .svn -o -name staging -o -name backup \) -prune \) -o -type f -name "\*.$suffix" -print0 | sort -z | xargs -0 $grp $@
    find      \( -type d \( -name .git -o -name .svn -o -name staging -o -name backup \) -prune \) -o -type f -name "\*.$suffix" -print0 | sort -z | xargs -0 $grp $@
}

s() {
    grp=$((which glark >/dev/null) && echo "glark" || echo "grep")
    for xx in "$@"; do echo xx: $xx; done

    for final in $@; do :; done
    if [[ -f $final || -d $final ]]
    then
	echo "running grep, since $final found as file or directory"
	grp=$((which glark >/dev/null) && echo "glark" || echo "grep")
	$grp $*
	return
    else
	echo "1: '$1'"
	case "$1" in
            r)   shift; f "rb"     | xargs $grp $* ;;
            erb) shift; f "erb"    | xargs $grp $* ;;
            gv)  shift; f "groovy" | xargs $grp $* ;;
            gr)  shift; f "gradle" | xargs $grp $* ;;
            j)   shift; f "java"   | xargs $grp $* ;;
            J)   shift; beseekjarfiles $* ;;
            x)   shift; f "xml"    | xargs $grp $* ;;
            Z|z) shift; beseekzipfiles $* ;;
            .)   shift; f "."      | xargs $grp $* ;;
            -s=*) sfx=$1; shift; echo "?"; sfx=`echo $sfx | sed -e 's/^\-s=\.\?/./'`; echo $sfx; beseekfiles $sfx $* ;;
            -s)   shift; sfx=$1; shift; echo "?"; sfx=`echo $sfx | sed -e 's/^\-s=\.\?/./'`; echo $sfx; beseekfiles $sfx $* ;;
            *)
		if [ -f "build.gradle" ]
		then
		    f "java" | xargs $grp $*
		elif [ -f "Rakefile" ]
		then
		    f "rb" | xargs $grep $*
		else
		    echo "not handled: $1"
		fi
		;;
	esac
    fi
}
