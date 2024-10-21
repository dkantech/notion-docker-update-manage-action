#!/bin/sh

set -e

NOTION_TOKEN=$1
DATABASE_ID=$2
DOCKER_IMAGE_TAG_NAME=$3
DOCKER_IMAGE_FULL_NAME=$4
CONTENT=$5
TYPE=$6


# NOTION_TOKEN=${INPUT_NOTION_TOKEN}
# DATABASE_ID=${INPUT_DATABASE_ID}
# DOCKER_IMAGE_TAG_NAME=${INPUT_DOCKER_IMAGE_TAG_NAME}
# DOCKER_IMAGE_FULL_NAME=${INPUT_DOCKER_IMAGE_FULL_NAME}
# CONTENT=${INPUT_CONTENT}
# TYPE=${INPUT_TYPE}


echo "Notion token: $NOTION_TOKEN"
echo "Notion token: ${NOTION_TOKEN:0:4}****"  # 마스킹된 토큰 출력
echo "Database ID: $DATABASE_ID"
echo "Docker Image Tag Name: $DOCKER_IMAGE_TAG_NAME"
echo "Docker Image Full Name: $DOCKER_IMAGE_FULL_NAME"
echo "Content: $CONTENT"
echo "Type: $TYPE"


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
