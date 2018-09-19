#!/bin/sh
cp conf-template/jira-wartung.conf conf/jira.conf
docker exec -it myproxy nginx -s reload
