#!/usr/bin/env bash
docker cp ./services/runner/config/config.toml runner:/etc/gitlab-runner/config.toml
docker exec -it runner sed -i "s/REGISTRATION_TOKEN/$1/g" /etc/gitlab-runner/config.toml
docker exec -it runner gitlab-runner restart