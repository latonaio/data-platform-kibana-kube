#!/bin/sh

ELASTICSEARCH_URL="http://localhost:9200"

source .env

INDEX_INFO=$(curl -s "${ELASTICSEARCH_URL}/_cat/shards" -H "Accept: application/json")
INDEX_NAMES=($(echo "$INDEX_INFO" | jq -r '.[].index'))

echo "$INDEX_INFO"

for index_name in "${INDEX_NAMES[@]}"; do
  # index_nameが"kibana"で始まるかどうかを確認
#  if [[ $index_name == kibana* ]]; then
#    # インデックス名を使用してDELETEリクエストを送信
#    curl -XDELETE "${ELASTICSEARCH_URL}/${index_name}"
#    echo "Deleted index: ${index_name}"
#  fi
#
  # インデックス名を使用してDELETEリクエストを送信
  curl -XDELETE "${ELASTICSEARCH_URL}/${index_name}"
  echo "Deleted index: ${index_name}"
done
