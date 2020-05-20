#!/usr/bin/env bash

docker run --rm -it \
  -v $(pwd)/services/runner/config:/etc/gitlab-runner \
  --network gitlab-workflow_default \
  gitlab/gitlab-runner register \
#  --non-interactive \
  --executor "docker" \
  --docker-image alpine:latest \
  --url "http://gitlab" \
  --registration-token "$0" \
  --description "docker-runner" \
  --tag-list "default-runner" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"