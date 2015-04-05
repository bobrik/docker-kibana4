# kibana 4 for Logsene in docker

This is dockerized version of [kibana 4](https://github.com/elasticsearch/kibana)
in a small 60mb container image. This fork configures Kibana 4 for Logsene.

Parameters:
- LOGSENE_TOKEN - Your Logsene App-Token
- KIBANA_USER - user to create in .htpasswd for Kibana4, defaults to "kibana"
- KIBANA_PASSWORD - password to use in .htpasswd, defaults to "secret"

## Running

```
docker pull sematext/kibana4
docker run -d -p 5609:5601 -e LOGSENE_TOKEN=YOUR-APP-TOKEN -e KIBANA_USER=logsene -e KIBANA_PASSWORD=secret sematext/kibana4
```
