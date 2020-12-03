#!/bin/bash -x

set -euo pipefail

./accept-third-party-license.sh
mkdir -p /tmp/jenkins-home
chown -R 1001:1001 .
#MAVEN_OPTS="-Duser.name=jenkins -Duser.home=/tmp/jenkins-home" \
#  ./mvnw \
#  -Dregistry.username=${DOCKER_HUB_USR} -Dregistry.password=${DOCKER_HUB_PSW} \
#  -Pci,all-dbs clean dependency:list test -Dsort -U -B
MAVEN_OPTS="-Duser.name=jenkins -Duser.home=/tmp/jenkins-home" \
  ./mvnw \
  -Dregistry.username=${DOCKER_HUB_USR} -Dregistry.password=wrong \
  -Pci,all-dbs clean dependency:list test -Dsort -U -B
