#!/bin/bash
set -e

echo "Creating operator index image"
echo "${REGISTRY}"
echo "${GIT_REV}"
echo "${INDEX_IMAGE}"
echo "${INDEX_IMAGE_TAG}"
echo "${BUNDLE_IMAGE}"

echo "opm index add --bundles ${REGISTRY}/${BUNDLE_IMAGE}:${GIT_REV} --tag ${REGISTRY}/${INDEX_IMAGE}:${GIT_REV} -u podman --pull-tool podman"
opm index add --bundles "${REGISTRY}/${BUNDLE_IMAGE}:${GIT_REV}" --tag "${REGISTRY}/${INDEX_IMAGE}:${GIT_REV}" -u podman --pull-tool podman

echo "podman tag ${REGISTRY}/${INDEX_IMAGE}:${GIT_REV} ${REGISTRY}/${INDEX_IMAGE}:${INDEX_IMAGE_TAG}"
podman tag "${REGISTRY}/${INDEX_IMAGE}:${GIT_REV}" "${REGISTRY}/${INDEX_IMAGE}:${INDEX_IMAGE_TAG}"
