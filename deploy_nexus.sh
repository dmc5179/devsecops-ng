#!/bin/bash
set -x

EPHEMERAL="false"

#oc new-project nexus

if [ "${EPHEMERAL}" == "true" ] ; then
  oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/nexus/master/nexus3-template.yaml --param=NEXUS_VERSION=3.13.0 --param=MAX_MEMORY=2Gi
else
  oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/nexus/master/nexus3-persistent-template.yaml --param=NEXUS_VERSION=3.13.0 --param=MAX_MEMORY=2Gi
fi

oc set resources dc/nexus --requests=cpu=200m,memory=1Gi --limits=cpu=2,memory=4Gi

# Wait until nexus is up and running
oc rollout status dc/nexus

