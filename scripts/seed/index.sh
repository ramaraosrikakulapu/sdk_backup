#!/bin/bash

echo "Test: $STACK"

cf login -a {{CF-API}} -u {{CF-USER}} -p {{CF-PWD}} -o {{CF-ORG}} -s {{CF-SPACE}}

cf push {{APP-NAME}} --docker-image enterpriseconnect/api:v1.2beta --no-start

cf set-env {{APP-NAME}} AGENT_REV temp_1.2-b.0.reiwa
cf set-env CA_PPRS {{ADMIN-HASH}}
cf set-env EC_AGT_GRP test
cf set-env EC_AGT_MODE "x:gateway"
cf set-env EC_API_APP_NAME ec
cf set-env EC_API_DEV_ID {{LICENSE-ID}}
cf set-env EC_API_OA2: {{SDC-URL}}
cf set-env EC_PORT: :8080
cf set-env EC_SEED_HOST: {{SEED-HOST}}
cf set-env EC_SEED_NODE: {{SEED-NODE}}

cf restage {{APP-NAME}}
