#!/bin/bash
set -a; source .env; set +a

echo "POSTGRES_HOST: $POSTGRES_HOST"
echo "POSTGRES_PORT: $POSTGRES_PORT"
echo "POSTGRES_USER: $POSTGRES_USER"

echo "ETHEREUM_RPC: $ETHEREUM_RPC"

cargo run -p graph-node -- \
  --postgres-url postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST:$POSTGRES_PORT/graph-node \
  --ethereum-rpc $ETHEREUM_RPC \
  --ipfs 127.0.0.1:5001
