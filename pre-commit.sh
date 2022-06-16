#!/usr/bin/env bash

export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

# source asdf setup
. ~/.bashrc
# shellcheck disable=SC1090
. ~/.asdf/asdf.sh

# Add this safe directory so we can check the code
git config --global --add safe.directory /src

cd /src || exit 1 && pre-commit run --all-files \
  && echo "Checking Markdown code..." \
  && markdownlint . \
    --ignore 'docs/reqs/**.md' \
    --ignore 'node_modules' \
    --config .markdownlint.json --ignore **/temp/** \
  && npx prettier --write . \
  && echo "Checking CircleCi Config..." \
  && if [ -d ".circleci" ]; then circleci config validate .circleci/config.yml; else echo "No CircleCi config found...continuing."; fi
#&& echo "Checking Ruby code..." \
#&& rufo . \
