# opensearch
OpenSearch Test

## Starting Opensearch

```
## Start docker container
docker run -d \
    -p 9200:9200 \
    -p 9600:9600 \
    -e "discovery.type=single-node" \
    opensearchproject/opensearch:latest
```
## Test
```
# Send a request to port 9200. The default username and password are admin.
curl https://localhost:9200 -ku 'admin:admin'
```

## Loading Data Into Opensearch

```
```

## Searching data (demo)

```
```