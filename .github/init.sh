#!/usr/bin/env bash

set -exu

ROOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
REPO_URLNAME=$(basename -s .git `git config --get remote.origin.url`)

# snake case name
REPO_SNAKE_NAME=$(basename -s .git `git config --get remote.origin.url` | tr '-' '_' | tr '[:upper:]' '[:lower:]')
REPO_OWNER=$(git config --get remote.origin.url | awk -F ':' '{print $2}' | awk -F '/' '{print $1}')

sed -i -e"s/python_module/$REPO_SNAKE_NAME" setup.py

mv python_module "$REPO_SNAKE_NAME"

