FROM java:8

ENV KIBANA_VERSION 4.0.0-beta3

RUN curl -s https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar zx -C /opt

ADD ./run.sh /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh
