#!/usr/bin/env bash

export PATH=/home/linter:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin:$PATH

# source asdf setup
. ~/.bashrc
# shellcheck disable=SC1090
. ~/.asdf/asdf.sh

# Add this safe directory so we can check the code
git config --global --add safe.directory /src

cd /src || exit 1 && pre-commit run --all-files \
  && echo "[ADDON] - Checking CircleCi Config (circleci)..." \
  && if [ -d "/src/.circleci" ]; then /home/linter/circleci config validate /src/.circleci/config.yml; else echo "No CircleCi config found...continuing."; fi \
  && echo "[ADDON] - Checking HTML files (prettier)..." \
  && npx prettier --embedded-language-formatting=off --check .
  #&& echo "Checking Ruby code..." \
  #&& rufo . \
