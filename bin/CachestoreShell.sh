#!/bin/bash

BASE_DIR=$(dirname $0)/..

export CLASSPATH=$CLASSPATH:$BASE_DIR/dist/resources
export CLASSPATH=$CLASSPATH:$BASE_DIR/dist/
export CLASSPATH=$CLASSPATH:$BASE_DIR/lib


for file in $BASE_DIR/dist/resources/*.jar; do
  export CLASSPATH=$CLASSPATH:$file
done


for file in $BASE_DIR/dist/*.jar; do
  export CLASSPATH=$CLASSPATH:$file
done

for file in $BASE_DIR/lib/*.jar; do
  export CLASSPATH=$CLASSPATH:$file
done

java -cp $CLASSPATH org.codehaus.groovy.tools.shell.Main $BASE_DIR/dist/resources/Utils.groovy $BASE_DIR/dist/resources/startup.groovy