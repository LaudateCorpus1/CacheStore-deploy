#!/bin/bash
BASE_DIR=$(dirname $0)/..

source $BASE_DIR/bin/Bootstrap.sh

JVM_SIZE="-server -Xms2g -Xmx8g"

echo "Using classpath:".$CLASSPATH

ps -o 'pgid=' $$ | sed 's/^\s*//' > $BASE_DIR/persist.pgid
java  $JVM_SIZE -cp $CLASSPATH com.sm.billing.persistence.UnisonCallBackImpl $@
