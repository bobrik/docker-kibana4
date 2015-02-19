FROM gliderlabs/alpine:3.1

ENV KIBANA_VERSION 4.0.0-linux-x64

RUN apk-install curl && \
    mkdir /opt && \
    curl -s https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar zx -C /opt && \
    apk-install nodejs && \
    rm -rf /opt/kibana-${KIBANA_VERSION}/node && \
    mkdir -p /opt/kibana-${KIBANA_VERSION}/node/bin && \
    ln -sf /usr/bin/node /opt/kibana-${KIBANA_VERSION}/node/bin/node && \
    apk del curl

ADD ./run.sh /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh
