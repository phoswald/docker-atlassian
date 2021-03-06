
openjdk-jdk-8
-------------

Overview:
- Based on OpenSUSE

Build:
$ docker build -t philip/openjdk-jdk-8 openjdk-jdk-8/

Test:
$ docker run -it --rm philip/openjdk-jdk-8 java -version
$ docker run -it --rm philip/openjdk-jdk-8 javac -version


oracle-jdk-8
------------

Overview:
- Based on OpenSUSE
- TAR.GZ has to be downloaded from Oracle

Build:
$ docker build -t philip/oracle-jdk-8 oracle-jdk-8/

Test:
$ docker run -it --rm philip/oracle-jdk-8 java -version
$ docker run -it --rm philip/oracle-jdk-8 javac -version


Jira Software
-------------

Overview:
- Dockerfile taken from https://github.com/cptactionhank/docker-atlassian-jira-software
- Based on OpenSUSE and Oracle JDK 8

Achtung:
- docker-entrypoint.sh muss ausführbar sein

Build:
$ docker build -t philip/jira-software jira-software/

Test:
$ docker run -d --name myjira -p 8080:8080 philip/jira-software

Volumes einrichten:
$ mkdir volumes/jira-home
$ mkdir volumes/jira-logs
$ chmod 777 volumes/jira-*

Run:
$ docker run -d --name myjira --rm \
  -p 8080:8080 \
  -v ~/volumes/jira-home:/var/atlassian/jira \
  -v ~/volumes/jira-logs:/opt/atlassian/jira/logs \
  -e X_PROXY_NAME=jira.local \
  -e X_PROXY_PORT=443 \
  -e X_PROXY_SCHEME=https \
  philip/jira-software

Run Database:
$ docker run -d --name mypostgres --rm \
  -p 5432:5432 \
  -v ~/volumes/postgres:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=1234 \
  postgres:9.6


Confluence
----------

Overview:
- Dockerfile taken from https://github.com/cptactionhank/docker-atlassian-confluence
- Based on OpenSUSE and Oracle JDK 8

Achtung:
- docker-entrypoint.sh muss ausführbar sein

Build:
$ docker build -t philip/confluence confluence/

Test:
$ docker run -d --name myconfluence -p 8090:8090 philip/confluence

Volumes einrichten:
$ mkdir volumes/confluence-home
$ mkdir volumes/confluence-logs
$ chmod 777 volumes/confluence-*

Run:
$ docker run -d --name myconfluence --rm \
  -p 8090:8090 \
  -p 8091:8091 \
  -v ~/volumes/confluence-home:/var/atlassian/confluence \
  -v ~/volumes/confluence-logs:/opt/atlassian/confluence/logs \
  -e X_PROXY_NAME=confluence.local \
  -e X_PROXY_PORT=443 \
  -e X_PROXY_SCHEME=https \
  -e X_PROXY_SECURE=true \
  philip/confluence


Proxy
-----

$ docker run -d --name myproxy --rm \
  -p 80:80 \
  -p 443:443 \
  -v `pwd`/proxy/conf:/etc/nginx/conf.d:ro \
  -v `pwd`/proxy/certs:/etc/nginx/certs:ro \
  -v `pwd`/proxy/html:/usr/share/nginx/html:ro \
  nginx:1.15.3-alpine

$ docker exec -it myproxy nginx -s reload


Self-Signed Certs
-----------------

$ cd proxy/certs
$ openssl req -newkey rsa:4096 -nodes -sha256 -x509 -days 365 -keyout jira_key.pem -out jira.pem
$ openssl req -newkey rsa:4096 -nodes -sha256 -x509 -days 365 -keyout confluence_key.pem -out confluence.pem
- Alle Defaults durchklicken ausser:
- Common Name (e.g. server FQDN or YOUR name) []: jira.local bzw. confluence.local
