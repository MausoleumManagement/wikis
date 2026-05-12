#!/bin/bash

# Generate random passwords
SUPERUSER_PW="$(openssl rand -base64 32 | tr -d '\n/+=' | cut -c1-32)"
APP_USER_PW="$(openssl rand -base64 32 | tr -d '\n/+=' | cut -c1-32)"

# Superuser (used by CNPG operator for admin tasks)
bao kv put kv/nekropolis/wiki-denkarium/postgres-superuser \
  username=postgres \
  password="${SUPERUSER_PW}"

# Application user (owns the `wiki` database; wiki.js connects as this)
bao kv put kv/nekropolis/wiki-denkarium/postgres-app-user \
  username=wiki \
  password="${APP_USER_PW}"

bao kv get kv/nekropolis/wiki-denkarium/postgres-superuser
bao kv get kv/nekropolis/wiki-denkarium/postgres-app-user

