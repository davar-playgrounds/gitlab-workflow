#!/usr/bin/env bash

if grep gitlab.local "/etc/hosts"; then
echo "Hosts already updated"
else
    sudo sh -c "echo \"\n127.0.0.1    gitlab.local\" >> /etc/hosts"
    echo "Host updated"
fi

docker run --entrypoint htpasswd registry:2 -Bbn gitlab secret > ./services/registry/auth/htpasswd
docker-compose up -d
docker login localhost:5000

echo "Please wait start Gitlab on http://gitlab.local:480"
echo "Register shared Runner:"
echo "1) Copy registration token on: http://gitlab.local:480/admin/runners"
echo "2) Execute script: ./register-runner.sh"