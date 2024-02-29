#!/usr/bin/env bash

set -exu

ROOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
REPO_URLNAME=$(basename -s .git `git config --get remote.origin.url`)

# snake case name
REPO_SNAKE_NAME=$(basename -s .git `git config --get remote.origin.url` | tr '-' '_' | tr '[:upper:]' '[:lower:]')
REPO_OWNER=$(git config --get remote.origin.url | awk -F ':' '{print $2}' | awk -F '/' '{print $1}')

sed -i -e"s/python_module/$REPO_SNAKE_NAME/" setup.py

mv python_module "$REPO_SNAKE_NAME"

cat << EOF > README.md
# $REPO_SNAKE_NAME

Fresh analysis project. Feel free to edit this README, which is in place to
understand the logistics of this repository.

## Development
These instructions will help you get started with creating a python package that
holds all of your analysis code. It's nice to prototype code wherever you
please, but if you want this code to exist in the long term, it's nice to put it
in a package.


To build a python virtual environment (good for prototyping), run:
\`\`\`
python -m venv ve
source ve/bin/activate
pip install -U pip setuptools
pip install -e $REPO_SNAKE_NAME
\`\`\`


If you'd rather use conda, run:
\`\`\`
conda create -n $REPO_SNAKE_NAME
conda activate $REPO_SNAKE_NAME
conda install pip
pip install -e $REPO_SNAKE_NAME
\`\`\`
EOF
