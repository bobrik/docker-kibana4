# kibana 4 in docker

## Deprecation notice

This image is deprecated in favor of `bobrik/kibana`: https://github.com/bobrik/docker-kibana

Note that this version contained a bug that resulted in using `kibana-int`
index instead of `.kibana` by default. After upgrading from `bobrik/kibana4`
to `bobrik/kibana` you would need to reindex data than was indexed
by `bobrik/kibana4`.

Here's how to do that:

1. Upgrade your kibana to `bobrik/kibana`.
2. Recreate index patterns in upgraded version.
3. Reindex visualizations, dashboards and searches:

```
docker run --rm -it bobrik/esreindexer \
    -src http://es:9200/kibana-int -dst http://es:9200/.kibana \
    -query '{"filtered":{"filter":{"exists":{"field":"kibanaSavedObjectMeta"}}}}'
```

Replace `http://es:9200` with your elasticsearch address.

Sorry for inconvenience.
