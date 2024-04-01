#!/usr/bin/env  bash

# From yesolution's mirror-action: https://github.com/yesolutions/mirror-action/blob/master/cred-helper.sh

GIT_PASSWORD=${INPUT_GIT_PASSWORD:-${GIT_PASSWORD}}
exec echo "$GIT_PASSWORD"