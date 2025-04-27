#!/bin/bash

# Usage check
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <remote_user> <remote_server>"
  exit 1
fi

# Input parameters
REMOTE_USER="$1"
REMOTE_SERVER="$2"

# Config
LOCAL_DIR="$(pwd)"   # current directory
REMOTE_DIR="/apps/LibreChat"
SSH_PORT=22  # Change if needed

echo "Syncing from $LOCAL_DIR to $REMOTE_USER@$REMOTE_SERVER:$REMOTE_DIR"

# Rsync command
rsync -avz --delete --exclude='.git' --files-from=<(git -C "$LOCAL_DIR" ls-files) \
  -e "ssh -p $SSH_PORT" \
  "$LOCAL_DIR"/ "$REMOTE_USER@$REMOTE_SERVER:$REMOTE_DIR/"

# Done
echo "Sync complete."
