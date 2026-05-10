#!/bin/bash
# Usage: ./deploy.sh user@votre-vps-ip
set -e

REMOTE=${1:?"Usage: $0 user@host"}
REMOTE_DIR="/opt/papaniang-editor"

echo "Deploying to $REMOTE:$REMOTE_DIR ..."

ssh "$REMOTE" "mkdir -p $REMOTE_DIR"

rsync -avz --progress \
  --exclude='.git' \
  --exclude='icon-gen.html' \
  --exclude='deploy.sh' \
  ./ "$REMOTE:$REMOTE_DIR/"

ssh "$REMOTE" "cd $REMOTE_DIR && docker compose up -d --build"

echo ""
echo "Done! App disponible sur http://$(echo $REMOTE | cut -d@ -f2):3007"
