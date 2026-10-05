# OpenSearch App Test

This folder validates the custom Shuffle OpenSearch app against a live OpenSearch node using certificate-based authentication.

## Prerequisites

- Running OpenSearch container named `shuffle-opensearch`
- Running from this repository root

## 1) Export test certificates

```bash
./shuffle-apps/opensearch/opensearch-test/setup_certs.sh
```

This copies:

- `root-ca.pem`
- `client.pem`
- `client-key.pem`

to `shuffle-apps/opensearch/opensearch-test/certs/`.

## 2) Create Python venv for app SDK testing

```bash
python -m venv /tmp/opensearch-app-venv
/tmp/opensearch-app-venv/bin/pip install -r app_sdk/requirements.txt
```

## 3) Run integration checks

```bash
/tmp/opensearch-app-venv/bin/python shuffle-apps/opensearch/opensearch-test/run_test.py
```

The test will:

1. call `cluster_health`
2. create test index
3. index a document
4. fetch and search the document
5. delete test index

It exits non-zero if any step fails.
