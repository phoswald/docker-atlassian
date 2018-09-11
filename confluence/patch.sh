#!/bin/sh
set -x

cd dependencies
cp atlassian-confluence-6.9.1/bin/setenv.sh .

sed -i -r 's/^(CATALINA_OPTS=.*)(-Xms[0-9]+[a-zA-Z]+)(.*)/\1\3/g' "setenv.sh"
sed -i -r 's/^(CATALINA_OPTS=.*)(-Xmx[0-9]+[a-zA-Z]+)(.*)/\1\3/g' "setenv.sh"

# use CATALINA_OPTS for java options for "start", "run" or "debug"
# use JAVA_OPTS for java options for all commands, including "stop" and "version"

