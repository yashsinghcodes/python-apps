# OpenSearch

OpenSearch Shuffle app with mTLS, basic auth, and API key support.

## Authentication

Configure `base_url` and one of these authentication modes:

1. mTLS
- `client_cert`: client certificate (Shuffle file ID, local file path, or inline PEM).
- `client_key`: client private key (Shuffle file ID, local file path, or inline PEM).

2. Basic auth
- `username`
- `password`

3. API key
- `api_key` (raw key or full `ApiKey ...` header value)

TLS options:

- `base_url`: OpenSearch base URL (e.g. `https://opensearch.example.com:9200`).
- `ca_cert` (optional): CA certificate (Shuffle file ID, local file path, or inline PEM).
- `verify` (optional): `true` or `false`.
- `timeout` (optional): Request timeout in seconds.

Notes:
- If `verify` is `true` and `ca_cert` is provided, the CA cert is used for TLS verification.
- For mTLS with a combined PEM file, upload the same file in both `client_cert` and `client_key`.

## Actions

- `cluster_health`: Get cluster health status.
- `list_indices`: List indices via `_cat/indices`.
- `get_index`: Get index settings and mappings.
- `create_index`: Create an index with settings/mappings.
- `delete_index`: Delete an index.
- `index_document`: Index a document by ID.
- `create_document`: Create a document with an auto-generated ID.
- `get_document`: Get a document by ID.
- `update_document`: Update a document by ID.
- `delete_document`: Delete a document by ID.
- `search`: Search an index by query DSL or query string.
- `bulk`: Bulk index/update/delete (NDJSON).
- `raw_request`: Send a custom request to any OpenSearch endpoint.

## Local development

From this version directory:

```bash
docker build -t shuffle-opensearch:1.0.0 .
docker run --rm shuffle-opensearch:1.0.0
```

Or run locally:

```bash
pip install -r requirements.txt
python src/app.py --log-level DEBUG
```
