#!/bin/bash
BASE_DIR=$(dirname $0)/..

source $BASE_DIR/bin/Bootstrap.sh

#jmxremote pw
if [ -f "$BASE_DIR/dist/resources/jmxremote.password" ]; then
	chmod 700 "$BASE_DIR/dist/resources/jmxremote.password"
else
	>"$BASE_DIR/dist/resources/jmxremote.password"
	chmod 700 "$BASE_DIR/dist/resources/jmxremote.password"
fi

#jmxremote access
if [ ! -f "$BASE_DIR/dist/resources/jmxremote.access" ]; then
	>"$BASE_DIR/dist/resources/jmxremote.access"
fi

# Min, max, total JVM size (-Xms -Xmx)
JVM_SIZE="-server -Xms8g -Xmx12g"

MAINCLASS="com.sm.store.server.grizzly.RemoteScan4ReplicaServer"

echo "Using classpath: $CLASSPATH"
echo "Using main class: $MAINCLASS"

ps -o 'pgid=' $$ | sed 's/^\s*//' > $BASE_DIR/cachestore.pgid
java  $OPTS $JVM_SIZE -cp $CLASSPATH $MAINCLASS $@
