#!/usr/bin/env bash
docker exec -it runner rm -rf /etc/gitlab-runner/config.toml
docker exec -it runner gitlab-runner register \
  --docker-network-mode="gitlab-workflow_default" \
  --description='CI-runner' \
  --url="http://gitlab" \
  --clone-url="http://gitlab" \
  --executor="docker" \
  --docker-image="docker" \
  --locked='false' \
  --paused='false' \
  --tag-list='default,runner'
