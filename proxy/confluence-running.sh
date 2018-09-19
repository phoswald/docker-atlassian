#!/bin/sh
cp conf-template/confluence-running.conf conf/confluence.conf
docker exec -it myproxy nginx -s reload
