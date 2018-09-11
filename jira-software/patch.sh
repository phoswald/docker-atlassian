#!/bin/sh
set -x

cd dependencies
cp atlassian-jira-software-7.9.1-standalone/bin/setenv.sh .

sed -i -r 's/^JVM_SUPPORT_RECOMMENDED_ARGS=/#&/g'                    "setenv.sh"
sed -i -r 's/^JVM_MINIMUM_MEMORY=/\#&/g'                             "setenv.sh"
sed -i -r 's/^JVM_MAXIMUM_MEMORY=/\#&/g'                             "setenv.sh"
sed -i -r 's/^(JAVA_OPTS=.*)-Xms\$\{JVM_MINIMUM_MEMORY\}(.*)/\1\2/g' "setenv.sh"
sed -i -r 's/^(JAVA_OPTS=.*)-Xmx\$\{JVM_MAXIMUM_MEMORY\}(.*)/\1\2/g' "setenv.sh"

# use CATALINA_OPTS for java options for "start", "run" or "debug"
# use JAVA_OPTS for java options for all commands, including "stop" and "version"

