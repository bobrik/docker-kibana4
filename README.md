# kibana 4 in docker

This is dockerized version of [kibana 4](https://github.com/elasticsearch/kibana)
in a small 60mb container image.

Parameters:
- KIBANA_ES_URL - Url to Elasticsearch Server, defaults to localhost:9200
- KIBANA_INDEX - Alternative Index name, where Kibana stores it's configuration/dashboards/index patterns, defaults to ".kibana"
- KIBANA_USER - user to create in .htpasswd for Kibana4, defaults to "kibana"
- KIBANA_PASSWORD - password to use in .htpasswd, defaults to "secret"

## Running

```
docker run -d -p <host ip>:<host port>:5601 -e KIBANA_ES_URL=<elasticsearch url>  bobrik/kibana4
```
