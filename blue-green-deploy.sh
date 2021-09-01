#!/bin/bash
# Script deploying app using blue green strategy 

DEPLOYMENT_FILE="k8s/deployment.yaml"
DEPLOYMENT_NAME="nodejs-deployment"
GREEN_VERSION="$(git rev-parse --short HEAD)"
DEPLOYMENT_REF="deploy/nodejs-deployment"
REMOVE_PREVIOUS_DEPLOYMENT=true
SERVICE_FILE="k8s/service.yaml"

echo "checking this"

BLUE_DEPLOYEMENT="$(kubectl get deploy -l app=coda-test-task -o jsonpath="{.items[0].metadata.name}")"
​
echo "${BLUE_DEPLOYEMENT}"

sed -i "s/VERSION_TO_REPLACE/${GREEN_VERSION}/g" ${DEPLOYMENT_FILE}
sed -i "s/VERSION_TO_REPLACE/${GREEN_VERSION}/g" ${SERVICE_FILE}
​
echo "INFO :: Deploying..."
kubectl apply -f ${DEPLOYMENT_FILE}
​
echo "INFO :: Verifying deployment status..."
kubectl rollout status "${DEPLOYMENT_REF}-${GREEN_VERSION}"
​
kubectl apply -f ${SERVICE_FILE}
​
if [ ${BLUE_DEPLOYEMENT} ]; then
	echo "INFO :: Removing previous deployment"
	kubectl delete deployment "${BLUE_DEPLOYEMENT}"
fi