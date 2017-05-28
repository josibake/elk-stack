#!/bin/bash

# host, usr, pass for cluster
MYDIR=$(cd $(dirname $0) && pwd)
. $MYDIR/cluster.txt

# config file and template name
TEMPLATE_FILE=$1
TEMPLATE_NAME=$2

# host 
ELASTIC_HOST_TEMPLATE="${ELASTIC_HOST}/_template/${TEMPLATE_NAME}"

# create template
curl -XPUT ${ELASTIC_HOST_TEMPLATE} \
	-u ${ELASTIC_USER}:${ELASTIC_PASSWD} \
		-H 'Content-Type: application/json' \
			-d @${TEMPLATE_FILE}