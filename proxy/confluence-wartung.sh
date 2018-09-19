#!/bin/sh
cp conf-template/confluence-wartung.conf conf/confluence.conf
docker exec -it myproxy nginx -s reload
