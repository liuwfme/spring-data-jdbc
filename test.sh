#!/bin/bash -x

set -euo pipefail

./accept-third-party-license.sh
mkdir -p /tmp/jenkins-home
chown -R 1001:1001 .
MAVEN_OPTS="-Duser.name=jenkins -Duser.home=/tmp/jenkins-home" ./mvnw -Dregistry.username=${USER} -Dregistry.password=${PASSWORD} -Pci,all-dbs clean dependency:list test -Dsort -U -B
