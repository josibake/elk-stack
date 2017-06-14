#!/bin/bash

# host, usr, pass for cluster
MYDIR=$(cd $(dirname $0) && pwd)
. $MYDIR/cluster.txt

# config file and template name
ROLE_FILE=$1
ROLE_NAME=$2

# host 
ELASTIC_HOST_TEMPLATE="${ELASTIC_HOST}/_xpack/security/role/${ROLE_NAME}"

# create template
curl -XPUT ${ELASTIC_HOST_TEMPLATE} \
	-u ${ELASTIC_USER}:${ELASTIC_PASSWD} \
		-H 'Content-Type: application/json' \
			-d @${ROLE_FILE}