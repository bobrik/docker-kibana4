#!/bin/sh

set -e

LOGSENE_TOKEN=${LOGSENE_TOKEN}
KIBANA_INDEX=${LOGSENE_TOKEN}_kibana 
KIBANA_ES_URL=https://logsene-receiver.sematext.com:443

curl -XPOST ${KIBANA_ES_URL}/${KIBANA_INDEX}

KIBANA_USER=${KIBANA_USER:-kibana}
KIBANA_PASSWORD=${KIBANA_PASSWORD:-secret}
# generate user and password for Kibana4
htpasswd -cb /opt/kibana-${KIBANA_VERSION}/src/.htpasswd $KIBANA_USER $KIBANA_PASSWORD 

sed -i "s;^elasticsearch_url:.*;elasticsearch_url: \"${KIBANA_ES_URL}\";" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"
sed -i "s;^kibana_index:.*;kibana_index: \"${KIBANA_INDEX}\";" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"

# mesos-friendly change
unset HOST
unset PORT

exec /opt/kibana-${KIBANA_VERSION}/bin/kibana
