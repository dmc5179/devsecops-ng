#!/bin/bash
set -x

#####
# Deploy Code Ready Workspaces

CRW_VERSION=1.2.2

tar -xf codeready-workspaces-1.2.2.GA-operator-installer.tar.gz
pushd codeready-workspaces-operator-installer
./deploy.sh --deploy --oauth --secure --project=workspaces
popd
#rm -rf codeready-workspaces-operator-installer
#

