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
env:
  GH_TOKEN: ${{ secrets.TOKEN }}
  REPO_NAME: ''
  NOTION_INPUT_TYPE: '' # 여기에는 버전 자동화를 수행하는 서버의 구분자를 입력


jobs:
  notion-update:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    
    # 도커 태그를 날짜로 할 경우, 날짜를 얻는 스크립트
    - name: Setup Date environment
      run: echo "branch_date=$(date +%Y%m%d-%H%M%S)" >> $GITHUB_ENV
      
    # 얻은 날짜를 확인하는 스크립트
    - name: Print Date
      run: echo "✨Build time is ${{env.branch_date}}✨"

    # 깃의 커밋메시지를 얻는 스크립트
    - name: Get commit message
      run: |
        echo "commit_message=$(git log -1 --pretty=%B $GITHUB_SHA)" >> $GITHUB_ENV
      
    # 깃의 커밋메시지를 확인하는 스크립트
    - name: Print Commit Message
      run: echo "Commit Message - ${{env.commit_message}}"

    # 노션API를 사용하여 입력하는 스크립트
    - name: Run Notion Update Action
      uses: dkantech/notion-docker-update-manage-action@v1
      with:
        notion_token: ${{ secrets.NOTION_TOKEN }}
        database_id: ${{ secrets.NOTION_UPDATE_MANAGE_DATABASE_ID }}
        docker_image_tag_name: "${{env.branch_date}}"
        docker_image_full_name: "${{REPO_NAME}}:${{env.branch_date}}"
        content: "${{env.commit_message}}"
        type: "${{env.NOTION_INPUT_TYPE}}"
```
