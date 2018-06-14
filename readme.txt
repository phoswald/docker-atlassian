
openjdk-jre-8
-------------

Overview:
- Based on OpenSUSE
- RPM has to be downloaded from Oracle

Build:
$ docker build -t philip/openjdk-jre-8 .

Test:
$ docker run -it --rm philip/openjdk-jre-8 java -version

TODO: make it smaller!


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
- Based on OpenSUSE and Oracle JRE 8

Build:
$ docker build -t philip/jira-software .

Test:
$ docker run -d --name myjira -p 8080:8080 philip/jira-software

Achtung:
- docker-entrypoint.sh muss ausführbar sein
