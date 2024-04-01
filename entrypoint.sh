#!/usr/bin/env bash
set -e

if [[ "${DEBUG}" -eq "true" ]]; then
    set -x
fi

git config --global --add safe.directory /github/workspace

# Setup the HTTPS credentials
git config --global credential.username "${INPUT_GIT_USERNAME}"

git config --global core.askPass /cred-helper.sh
git config --global credential.helper cache

git clone -b ${INPUT_GIT_BRANCH} ${INPUT_GIT_REMOTE} ${INPUT_REPO_NAME}

pwd && ls -laR

cd ${INPUT_REPO_NAME}
