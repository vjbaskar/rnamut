#!/usr/bin/env bash

Help() {
    echo "
    You should provide a minimal option eg.
    RNAmut <memory to be used (mb)>
    eg> RNAmut 2048
    "
}


if [ $# -eq 0 ]; then
    Help
    exit 0
fi

mem_in_mb=$1; shift
i=${mem_in_mb}
if  test -z "${i//[0-9]}" ; then
    continue
else
    Help    
    exit 1
fi
JAVA_COMMAND="java"
JAVA_OPTIONS="-Xms${mem_in_mb}m -Xmx${mem_in_mb}m"

#%JAR_FILE="/home/vijay/tmpd/rnamut/RNAmut.jar"

ARGS=$@
JC="${JAVA_COMMAND} ${JAVA_OPTIONS} -jar ${JAR_FILE} ${ARGS}"
echo ${JC} && ${JC}

