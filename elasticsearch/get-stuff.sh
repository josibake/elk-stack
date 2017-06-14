#!/bin/bash

# host, usr, pass for cluster
MYDIR=$(cd $(dirname $0) && pwd)
. $MYDIR/cluster.txt

# host 
ELASTIC_HOST_PATH="${ELASTIC_HOST}/_xpack/security/role/emerson?pretty"

# create template
curl -XGET ${ELASTIC_HOST_PATH} \
	-u ${ELASTIC_USER}:${ELASTIC_PASSWD}