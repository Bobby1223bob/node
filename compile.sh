#!/bin/sh

if [ -x jdk/bin/java ]; then
    JAVA=./jdk/bin/java
    JAVAC=./jdk/bin/javac
    JAR=./jdk/bin/jar
else
    JAVA=java
    JAVAC=javac
    JAR=jar
fi

PATHSEP=":"
if [ "$OSTYPE" = "cygwin" ] ; then
PATHSEP=";"
fi

CP="lib/*${PATHSEP}classes${PATHSEP}javafx-sdk/lib/*"
SP=src/java/
APPLICATION="Blue0x"

/bin/rm -rf classes
/bin/mkdir -p classes/

echo "Compiling core, please wait..."
echo " "

find src/java/nxt/ -name "*.java" > sources.tmp
${JAVAC} -encoding utf8 -sourcepath "${SP}" -classpath "${CP}" -d classes/ @sources.tmp > /dev/null 2>&1 || exit 1

rm -f sources.tmp

echo "Compilation done."
echo " "
echo "Start Blue0x with ./run.sh or ./run.sh --daemon to run in the background."
echo " "
