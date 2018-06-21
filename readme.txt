
openjdk-jre-8
-------------

Overview:
- Based on OpenSUSE

Build:
$ docker build -t philip/openjdk-jre-8 .

Test:
$ docker run -it --rm philip/openjdk-jre-8 java -version


oracle-jre-8
------------

Overview:
- Based on OpenSUSE
- RPM has to be downloaded from Oracle

Build:
$ docker build -t philip/oracle-jre-8 .

Test:
$ docker run -it --rm philip/oracle-jre-8 java -version

TODO: make it smaller!


Confluence
----------

Overview:
- Dockerfile taken from https://github.com/cptactionhank/docker-atlassian-confluence
- Based on OpenSUSE and Oracle JRE 8

Build:
$ docker build -t philip/confluence .

Test:
$ docker run -d --name myconfluence -p 8090:8090 philip/confluence

Achtung:
- docker-entrypoint.sh muss ausführbar sein


Jira Software
-------------

Overview:
- Dockerfile taken from https://github.com/cptactionhank/docker-atlassian-jira-software
- Based on OpenSUSE and OpenJDK JRE 8

Build:
$ docker build -t philip/jira-software .

Run:
$ docker run -d --name myjira -p 8080:8080 philip/jira-software

Volumes einrichten:
$ mkdir volumes/jira-home
$ mkdir volumes/jira-logs
$ chmod 777 volumes/jira-*

$ docker run -d --name myjira --rm \
  -p 8080:8080 \
  -v ~/volumes/jira-home:/var/atlassian/jira \
  -v ~/volumes/jira-logs:/opt/atlassian/jira/logs \
  philip/jira-software

Run Database:
$ docker run -d --name mypostgres --rm \
  -p 5432:5432 \
  -v ~/volumes/postgres:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=1234 \
  postgres:9.6

Achtung:
- docker-entrypoint.sh muss ausführbar sein

TODO: DB Config
TODO: Volume permissions
TODO: Oracle JDK
TODO: Time zone
- Meldung: Die Zeitzone Ihres Computers stimmt nicht mit der Zeitzonenvoreinstellung von JIRA ((GMT+00:00) UTC) überein.
- Link: http://localhost:8080/secure/ViewProfile.jspa#zone-set
TODO: JVM Memory Settings
TODO: Sprachen: genügt "Deutsch (Deutschland)"?

