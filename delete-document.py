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

# Delete the document.
response = client.delete(
    index = 'test-index',
    id = '1'
)

print('\nDeleting document:')
print(response)

