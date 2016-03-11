#!/bin/bash

PGID_FILE=$1

if [ -e  $PGID_FILE ]; then
    PGID=$(cat $PGID_FILE)

    kill -- -$PGID

    KILL_RESULT=$(ps -ao 'pgid=' | grep $PGID)
    while [ -n "$KILL_RESULT" ]; do
        KILL_RESULT=$(ps -ao 'pgid' | grep $PGID)
    done

    rm -v $PGID_FILE
else
    echo "Could not find $PGID_FILE"
fi
