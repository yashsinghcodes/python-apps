#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="/home/darksoul/git/Shuffle/shuffle-apps/opensearch/opensearch-test/certs"
mkdir -p "$OUT_DIR"

docker cp shuffle-opensearch:/usr/share/opensearch/config/root-ca.pem "$OUT_DIR/root-ca.pem"
docker cp shuffle-opensearch:/usr/share/opensearch/config/kirk.pem "$OUT_DIR/client.pem"
docker cp shuffle-opensearch:/usr/share/opensearch/config/kirk-key.pem "$OUT_DIR/client-key.pem"

echo "Wrote certs to $OUT_DIR"
