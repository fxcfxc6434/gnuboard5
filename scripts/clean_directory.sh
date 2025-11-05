#!/bin/bash

# 그누보드가 설치될 디렉토리 경로
DEPLOY_DIR="/var/www/html/gnuboard5"

# 1. 만약 디렉토리가 이미 존재한다면, 통째로 삭제합니다.
if [ -d "$DEPLOY_DIR" ]; then
    rm -rf "$DEPLOY_DIR"
fi

# 2. 배포를 위해 비어있는 새 디렉토리를 생성합니다.
mkdir -p "$DEPLOY_DIR"

# 3. CodeDeploy가 파일 복사 후 권한 문제를 일으키지 않도록 미리 소유권을 변경합니다.
chown apache:apache "$DEPLOY_DIR"
