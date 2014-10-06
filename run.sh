#!/bin/sh

set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://localhost:9200}
KIBANA_INDEX=${KIBANA_INDEX:-kibana-int}

sed -i "s;^elasticsearch:.*;elasticsearch: ${KIBANA_ES_URL};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"
sed -i "s;^kibanaIndex:.*;kibanaIndex: ${KIBANA_INDEX};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"

exec /opt/kibana-${KIBANA_VERSION}/bin/kibana
