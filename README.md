# Notion Docker Update Manage Action

도커 이미지 업데이트 기록을 자동화하는 액션

## Inputs

- `notion_token`: Notion API token (required)
- `database_id`: ID of the Notion database (required)
- `docker_tag_name`: Name of the Docker tag (required)
- `docker_image_name`: Name of the full Docker image (required)
- `content`: Content description (required)
- `type`: Type of the entry (required)

## Example Usage

```yaml
jobs:
  notion-update:
    runs-on: ubuntu-latest

    steps:
    - name: Run Notion Update Action
      uses: dkantech/notion-docker-update-manage-action
      with:
        notion_token: ${{ secrets.NOTION_TOKEN }}
        database_id: ${{ secrets.NOTION_UPDATE_MANAGE_DATABASE_ID }}
        docker_image_tag_name: "테스트태그"
        docker_image_full_name: "테스트이미지명"
        content: "내용입니다"
        type: "테스트종류"
```
