from opensearchpy import OpenSearch

client = OpenSearch(
    hosts = [{ 'host': 'localhost', 'port': 9200 }],
    http_auth = ('admin', 'admin'),
    http_compress = True, # enables gzip compression for request bodies
    use_ssl = True,
    verify_certs = False,
    ssl_assert_hostname = False,
    ssl_show_warn = False
)

# Create an index
response = client.indices.create( 'test-index', {
  'settings': {
        'index': {
            'number_of_shards': 4
        }
    }
})

print('\nCreating index:')
print(response)
