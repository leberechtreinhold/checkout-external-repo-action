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
find . -maxdepth 3 -type d

cd ${INPUT_REPO_NAME}

git config --global credential.user.name "${INPUT_GIT_USER}"
git config --global credential.user.email "${INPUT_GIT_EMAIL}"

echo "Executing commands..."
echo ${INPUT_ADDITIONAL_COMMANDS}
echo ${INPUT_ADDITIONAL_COMMANDS} > to_run.sh
chmod +x to_run.sh
./to_run.sh