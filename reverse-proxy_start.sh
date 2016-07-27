#!/bin/bash

RP_NET=reverse-proxy

docker network create -d bridge ${RP_NET}

docker run -d \
	-p 80:80 \
	--restart always \
	--name reverse-proxy \
	-v /var/run/docker.sock:/tmp/docker.sock:ro \
	--net=${RP_NET} \
	jwilder/nginx-proxy

# Добавляем все сети созданные  docker-compose
# docker network ls | awk '/_default/ { system("docker network connect " $2 " reverse-proxy") }'

# Отдельно остальные
# docker network connect apkserver reverse-proxy
