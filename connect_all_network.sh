#!/usr/bin/env bash

docker network ls | awk '/_default/ { system("docker network connect " $2 " reverse-proxy") }'

# Добавляем в сеть gitlab_default контейнер с reverse-proxy
#docker network connect "$@" reverse-proxy