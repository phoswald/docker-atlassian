#!/bin/sh
cp conf-template/jira-running.conf conf/jira.conf
docker exec -it myproxy nginx -s reload
