#!/bin/sh

set -e

NOTION_TOKEN=$1
DATABASE_ID=$2
DOCKER_IMAGE_TAG_NAME=$3
DOCKER_IMAGE_FULL_NAME=$4
CONTENT=$5
TYPE=$6

curl -X POST "https://api.notion.com/v1/pages" \
  -H "Authorization: Bearer $NOTION_TOKEN" \
  -H "Content-Type: application/json" \
  -H "Notion-Version: 2022-06-28" \
  --data '{
    "parent": { "database_id": "'"$DATABASE_ID"'" },
    "properties": {
      "도커태그명": {
        "title": [{ "text": { "content": "'"$DOCKER_IMAGE_TAG_NAME"'" } }]
      },
      "전체도커이미지명": {
        "rich_text": [{ "text": { "content": "'"$DOCKER_IMAGE_FULL_NAME"'" } }]
      },
      "내용": {
        "rich_text": [{ "text": { "content": "'"$CONTENT"'" } }]
      },
      "종류": {
        "select": { "name": "'"$TYPE"'" }
      }
    }
  }'
