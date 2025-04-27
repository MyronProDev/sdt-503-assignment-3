#!/usr/bin/env bash
set -eux

# allow overrides: -JTHREADS, -JLOOP
JMETER_HOME=/opt/apache-jmeter-${JMETER_VERSION:-5.5}
TEST_PLAN=user-api.jmx
LOG_FILE=results.jtl

# inject variables if needed: e.g. HOST, PORT
"$JMETER_HOME/bin/jmeter" \
  -n \
  -t "$TEST_PLAN" \
  -l "$LOG_FILE" \
  -Jusers=${PWD}/data/users.csv \
  "$@"
