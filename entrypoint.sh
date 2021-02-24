#!/bin/bash -l

set -e

DOCKERFILE=$1
GITHUB_USER=$2
GITHUB_TOKEN=$3
PROJECT=$4
GOSEC_OPTS=$5
SKIP_GOVET=$6
SKIP_STATICCHECK=$7
SKIP_GOSEC=$8
SKIP_TESTS=$9
SKIP_GOLANGCI_LINT=$10

if [ -z "${DOCKERFILE}" ]; then echo "::error ::Undefined dockerfile" && exit 1; fi
if [ -z "${GITHUB_USER}" ]; then echo "::error ::Undefined github user" && exit 1; fi
if [ -z "${GITHUB_TOKEN}" ]; then echo "::error ::Undefined github token" && exit 1; fi
if [ -z "${PROJECT}" ]; then echo "::error ::Undefined project" && exit 1; fi


docker build --build-arg GITHUB_USER="${GITHUB_USER}" --build-arg GITHUB_TOKEN="${GITHUB_TOKEN}" --build-arg GOSEC_OPTS="${GOSEC_OPTS}" --build-arg SKIP_GOVET="${SKIP_GOVET}" --build-arg SKIP_STATICCHECK="${SKIP_STATICCHECK}" --build-arg SKIP_GOSEC="${SKIP_GOSEC}" --build-arg SKIP_TESTS="${SKIP_TESTS}" --build-arg SKIP_GOLANGCI_LINT="${SKIP_GOLANGCI_LINT}" . -f "${DOCKERFILE}"
