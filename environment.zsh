#!/usr/bin/zsh
# -*- sh -*-

export JAVA_COMPILER=NONE
# export JAVA_HOME=/usr/java/jdk1.5.0_22
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk

# standard stuff:
export CLASSPATH=/usr/java/jre/lib:/usr/java/lib:.:~/lib/java

# for JUnit:
export CLASSPATH=$CLASSPATH:/usr/java/lib/junit.jar

export ANT_HOME=/usr/share/apache-ant-1.8.2
export GRADLE_HOME=/opt/gradle-1.0-milestone-3
export PATH=`~/bin/mkpath $JAVA_HOME/bin:$PATH:.:$ANT_HOME/bin:$GRADLE_HOME/bin`

export PERL5LIB=~/lib/perl5
export RUBYLIB=~/lib/ruby

# don't put repeated commands in the history:
export HISTCONTROL=ignoredups

export LD_LIBRARY_PATH=/usr/local/lib:.

eval `dircolors ~/.dircolorsrc`
export ZLS_COLORS=$LS_COLORS

# need 2 ctrl-D's to quit
export IGNOREEOF=2

# default places to look while cd'ing
export CDPATH=.:~:/proj:..

export HISTFILE=~/.zsh_history
export SAVEHIST=3000
export HISTSIZE=1000

setopt HISTIGNOREDUPS
setopt IGNORE_EOF

export NPX_PLUGIN_PATH=$JAVA_HOME/jre/bin

export ANT_OPTS=-mx512M

export LESSOPEN="|lesspipe.sh %s"

export GROOVY_HOME=/usr/share/groovy

export CLASSPATH_EXTRA_JARS=/usr/java/lib/tools.jar:~/proj/qualog/lib/qualog.jar

export TZ="US/Eastern"
