#!/bin/bash -l

set -e

DOCKERFILE=$1
GITHUB_USER=$2
GITHUB_TOKEN=$3
PROJECT=$4
GOSEC_OPTS=$5

if [ -z "${DOCKERFILE}" ]; then echo "::error ::Undefined dockerfile" && exit 1; fi
if [ -z "${GITHUB_USER}" ]; then echo "::error ::Undefined github user" && exit 1; fi
if [ -z "${GITHUB_TOKEN}" ]; then echo "::error ::Undefined github token" && exit 1; fi
if [ -z "${PROJECT}" ]; then echo "::error ::Undefined project" && exit 1; fi


docker build --build-arg GITHUB_USER="${GITHUB_USER}" --build-arg GITHUB_TOKEN="${GITHUB_TOKEN}" --build-arg GOSEC_OPTS="${GOSEC_OPTS}" . -f "${DOCKERFILE}"
