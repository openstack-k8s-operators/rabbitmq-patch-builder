#!/bin/bash
set -e

echo "Creating rabbitmq operator bundle"
cd ../..
echo "${GIT_REV}"
echo "${BASE_IMAGE}"

RELEASE_VERSION=$(grep "^VERSION" Makefile | awk -F'?= ' '{ print $2 }')
echo "Release Version: $RELEASE_VERSION"

echo "Creating bundle image..."
#Custom bundle build as upstream doesn't have this Makefile target
make manifests
operator-sdk generate kustomize manifests -q
pushd config/manager
kustomize edit set image controller="${REGISTRY}/${BASE_IMAGE}:${GIT_REV}"
popd
kustomize build config/manifests | operator-sdk generate bundle --overwrite --verbose --use-image-digests
cp properties.yaml ./bundle/metadata
#FIXME: look into why scorecard isn't being deactivated
sed -e '/.*scorecard/d' -i bundle.Dockerfile
operator-sdk bundle validate ./bundle
