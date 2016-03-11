#!/bin/bash
BASE_DIR=$(dirname $0)/..

bash $BASE_DIR/bin/StopProcess.sh $BASE_DIR/cachestore.pgid
