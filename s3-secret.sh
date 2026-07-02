#!/bin/bash

bao kv put kv/nekropolis/wiki-denkarium/s3-backup-credentials \
  ACCESS_KEY_ID=abc \
  ACCESS_SECRET_KEY=def \
  REGION="garage"
