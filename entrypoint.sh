#!/usr/bin/env bash
set -e

cd ${INPUT_WORKING_DIR}

git config --global --add safe.directory /github/workspace

# Setup the HTTPS credentials
git config --global credential.username "${INPUT_GIT_USERNAME}"

git config --global core.askPass /cred-helper.sh
git config --global credential.helper cache

git clone -b ${INPUT_GIT_BRANCH} ${INPUT_GIT_REMOTE} ${INPUT_REPO_NAME}

echo "Cloned repository..."
pwd

echo "Current tree..."
ls -laR

echo "Executing commands..."
eval "${INPUT_ADDITIONAL_COMMANDS}"