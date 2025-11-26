#!/bin/sh
if [ -x jdk/bin/java ]; then
    JAVA=./jdk/bin/java
    JAR=./jdk/bin/jar
elif [ -x ../jdk/bin/java ]; then
    JAVA=../jdk/bin/java
    JAR=../jdk/bin/jar
else
    JAVA=java
    JAR=jar
fi
${JAVA} -cp classes nxt.tools.ManifestGenerator
/bin/rm -f Blue0x.jar
${JAR} cfm Blue0x.jar resource/nxt.manifest.mf -C classes . || exit 1
echo " "
echo "Generating jar...."
echo " "
echo "Jar generated successfully!"
echo " "