FROM alpine:3.12

# 필요한 패키지를 설치 (예: curl)
RUN apk add --no-cache curl

# entrypoint.sh 스크립트를 컨테이너에 복사
COPY entrypoint.sh /entrypoint.sh

# 실행 권한 부여
RUN chmod +x /entrypoint.sh

# 기본 엔트리포인트 설정
ENTRYPOINT ["/entrypoint.sh"]
