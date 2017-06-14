#!/bin/bash

# host, usr, pass for cluster
MYDIR=$(cd $(dirname $0) && pwd)
. $MYDIR/cluster.txt

# host 
ELASTIC_HOST_PATH_1="${ELASTIC_HOST}/.kibana-emerson1/index-pattern/car-*"
ELASTIC_HOST_PATH_2="${ELASTIC_HOST}/.kibana-emerson1/config/5.4.1"

# create index pattern
curl -XPUT ${ELASTIC_HOST_PATH_1} \
	-u ${ELASTIC_USER}:${ELASTIC_PASSWD} \
		-d '{"title" : "car-*",  "timeFieldName": "Time"}'

curl -XPUT ${ELASTIC_HOST_PATH_2} \
	-u ${ELASTIC_USER}:${ELASTIC_PASSWD} \
		-d '{"defaultIndex" : "car-*"}'	