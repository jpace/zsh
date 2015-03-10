hash -d incava=/proj/org/incava

hash -d doctorj=~incava/doctorj
hash -d doctorjsrc=~incava/doctorj/src/main/java/org/incava/doctorj
hash -d doctorjtst=~incava/doctorj/src/test/java/org/incava/doctorj

hash -d diffj=~incava/diffj
hash -d diffjsrc=~incava/diffj/src/main/java/org/incava/diffj
hash -d diffjtst=~incava/diffj/src/test/java/org/incava/diffj

hash -d ijdkproj=~incava/ijdkproj
hash -d ijdksrc=~ijdkproj/src/main/java/org/incava/ijdk
hash -d ijdktst=~ijdkproj/src/test/java/org/incava/ijdk

hash -d glark=~incava/glark
hash -d logue=~incava/logue
hash -d pvn=~incava/pvn
hash -d ragol=~incava/ragol
hash -d riel=~incava/riel
hash -d svnx=~incava/svnx
hash -d synoption=~incava/synoption
hash -d xumoqi=~incava/workspace/xumoqi

hash -d incava.org=~/proj/rails.incava.org
hash -d incava.rails=~/proj/org/incava/rails

hash -d railtut=~incava/rails/tutorial
hash -d rtsapp=~railtut/it0/sample_app

export JAVA_COMPILER=NONE

# standard stuff:
export CLASSPATH=/usr/java/jre/lib:/usr/java/lib:.:~/lib/java

# for JUnit:
export CLASSPATH=$CLASSPATH:/usr/java/lib/junit.jar

export ANT_HOME=/usr/share/apache-ant-1.8.2
export GRADLE_HOME=/opt/gradle-1.12
export SCALA_HOME=/Programs/org/scala/scala-2.10.0
export PATH=$JAVA_HOME/bin:$SCALA_HOME/bin:$GRADLE_HOME/bin:$PATH:.:$ANT_HOME/bin
