#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh

cd "${REPO_DIR}"

readonly SCRIPT_DIR_REL=".${SCRIPT_DIR#"${REPO_DIR}"}"

set -x
git apply "${SCRIPT_DIR_REL}/_values.yaml.patch"

# get the upstream sync version from vendir.yml
UPSTREAM_SYNC_VERSION=$(yq -r .directories[0].contents[0].git.ref ${REPO_DIR}/vendir.yml)
# update patched values.yaml
sed -i -E "s/IMAGE_TAG/${UPSTREAM_SYNC_VERSION}/g" "${CHART_DIR}/values.yaml"

{ set +x; } 2>/dev/null
