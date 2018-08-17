
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

TODO: make it smaller!


Confluence
----------

Overview:
- Dockerfile taken from https://github.com/cptactionhank/docker-atlassian-confluence
- Based on OpenSUSE and Oracle JDK 8

Build:
$ docker build -t philip/confluence confluence/

Test:
$ docker run -d --name myconfluence -p 8090:8090 philip/confluence

Achtung:
- docker-entrypoint.sh muss ausführbar sein


Jira Software
-------------

Overview:
- Dockerfile taken from https://github.com/cptactionhank/docker-atlassian-jira-software
- Based on OpenSUSE and Oracle JDK 8

Build:
$ docker build -t philip/jira-software jira-software/

Run:
$ docker run -d --name myjira -p 8080:8080 philip/jira-software

Volumes einrichten:
$ sudo useradd -U jira
$ sudo chown jira:jira test
$ sudo chmod 755 test

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
TODO: JVM Memory Settings
TODO: Sprachen: genügt "Deutsch (Deutschland)"?

