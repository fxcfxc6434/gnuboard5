#!/bin/bash

DEPLOY_DIR="/var/www/html/gnuboard5"
BACKUP_DIR="/tmp/gnuboard_backup_data"

# 1. 'data' 폴더가 있다면, /tmp로 잠시 백업합니다.
if [ -d "$DEPLOY_DIR/data" ]; then
    sudo mv "$DEPLOY_DIR/data" "$BACKUP_DIR"
fi

# 2. 배포 폴더를 청소합니다.
if [ -d "$DEPLOY_DIR" ]; then
    sudo rm -rf "$DEPLOY_DIR"
fi
sudo mkdir -p "$DEPLOY_DIR"

# 3. 백업해둔 'data' 폴더를 다시 원위치시킵니다.
if [ -d "$BACKUP_DIR" ]; then
    sudo mv "$BACKUP_DIR" "$DEPLOY_DIR/data"
fi

# 4. 소유권 설정 (data 폴더 포함)
sudo chown -R apache:apache "$DEPLOY_DIR"
