#!/bin/bash -e

mkdir -p /etc/fluent

CONFD_BACKEND=${CONFD_BACKEND:-env}
confd -onetime -backend ${CONFD_BACKEND}

bundle install --path vendor --binstubs /usr/local/bin

$@
