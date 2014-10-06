FROM java:8

ENV KIBANA_VERSION 4.0.0-BETA1

RUN curl https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar zx -C /opt

ADD ./run.sh /run.sh

ENTRYPOINT /run.sh
