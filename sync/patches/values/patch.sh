#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh
VALUES_YAML="${REPO_DIR}/helm/proxmox-csi-plugin/values.yaml" ; readonly VALUES_YAML

cd "${REPO_DIR}"

readonly SCRIPT_DIR_REL=".${SCRIPT_DIR#"${REPO_DIR}"}"

set -x
git apply "${SCRIPT_DIR_REL}/_values.yaml.patch"

# get the upstream sync version from vendir.yml
UPSTREAM_SYNC_VERSION=$(yq -r .directories[0].contents[0].git.ref ${REPO_DIR}/vendir.yml)
# update patched values.yaml
sed -i -E "s/IMAGE_TAG/${UPSTREAM_SYNC_VERSION}/g" "${CHART_DIR}/values.yaml"

# Some changes to values.yaml cannot be applied using the patch file as the
# changes are too close to each other in the file and the patch file does not
# contain enough context for the patch to apply cleanly. Instead we make those
# changes manually after the base patch has been applied.

sed -i 's|registry.k8s.io/sig-storage/|gsoci.azurecr.io/giantswarm/|g' "${VALUES_YAML}"
sed -i 's|ghcr.io/sergelogvinov/|gsoci.azurecr.io/giantswarm/|g' "${VALUES_YAML}"

{ set +x; } 2>/dev/null
