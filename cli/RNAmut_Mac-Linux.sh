#!/usr/bin/env bash

JAVA_COMMAND="java"
JAVA_OPTIONS="-Xms1g -Xmx1g"

#%JAR_FILE="/home/vijay/tmpd/rnamut/RNAmut.jar"

ARGS=$@
JC="${JAVA_COMMAND} ${JAVA_OPTIONS} -jar ${JAR_FILE} ${ARGS}"
echo ${JC} && ${JC}

