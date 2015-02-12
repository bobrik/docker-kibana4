#!/bin/sh

set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://localhost:9200}
KIBANA_INDEX=${KIBANA_INDEX:-kibana-int}

sed -i "s;^elasticsearch_url:.*;elasticsearch_url: ${KIBANA_ES_URL};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"
sed -i "s;^kibana_index:.*;kibana_index: ${KIBANA_INDEX};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"

# mesos-friendly change
unset HOST
unset PORT

exec /opt/kibana-${KIBANA_VERSION}/bin/kibana
