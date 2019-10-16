#!/bin/bash
set -x

EPHEMERAL="false"

#oc new-project sonarqube

if [ "${EPHEMERAL}" == "true" ] ; then
  oc new-app -f https://raw.githubusercontent.com/siamaksade/sonarqube/master/sonarqube-template.yml --param=SONARQUBE_MEMORY_LIMIT=6Gi
else
  oc new-app -f https://raw.githubusercontent.com/siamaksade/sonarqube/master/sonarqube-persistent-template.yml --param=SONARQUBE_MEMORY_LIMIT=6Gi
fi

oc rollout status dc/sonarqube


