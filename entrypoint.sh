#!/bin/bash -l

set -e

DOCKERFILE=$1
GITHUB_USER=$2
GITHUB_TOKEN=$3
PROJECT=$4
GOSEC_OPTS=$5
GCLOUD_TOKEN=$6

if [ -z "${DOCKERFILE}" ]; then echo "::error ::Undefined dockerfile" && exit 1; fi
if [ -z "${GITHUB_USER}" ]; then echo "::error ::Undefined github user" && exit 1; fi
if [ -z "${GITHUB_TOKEN}" ]; then echo "::error ::Undefined github token" && exit 1; fi
if [ -z "${PROJECT}" ]; then echo "::error ::Undefined project" && exit 1; fi
if [ -z "${GCLOUD_TOKEN}" ]; then echo "::error ::Undefined GCLOUD_TOKEN" && exit 1; fi

echo "Login to GCR"
echo "${GCLOUD_TOKEN}" | base64 -d | docker login -u _json_key --password-stdin https://eu.gcr.io

docker build --build-arg GITHUB_USER="${GITHUB_USER}" --build-arg GITHUB_TOKEN="${GITHUB_TOKEN}" --build-arg PROJECT="${PROJECT}" --build-arg GOSEC_OPTS="${GOSEC_OPTS}" . -f "${DOCKERFILE}"
