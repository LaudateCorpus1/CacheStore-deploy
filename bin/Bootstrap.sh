#!/bin/bash

BASE_DIR=$(dirname $0)/..

export CLASSPATH=$CLASSPATH:$BASE_DIR/dist/resources


for file in $BASE_DIR/dist/resources/*.jar; do
  export CLASSPATH=$CLASSPATH:$file
done

for file in $BASE_DIR/dist/*.jar; do
  export CLASSPATH=$CLASSPATH:$file
done

for file in $BASE_DIR/lib/*.jar; do
  export CLASSPATH=$CLASSPATH:$file
done

OPTS=""
jmxfile=$BASE_DIR/dist/resources/jmxremote.properties
if [ -x $jmxfile ]; then
   OPTS=$OPTS"-Dcom.sun.management.config.access.file=$jmxfile "
else
   echo "$jmxfile not found, skipping JMX"
fi