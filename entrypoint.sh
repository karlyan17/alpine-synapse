#!/bin/sh
source /.dockerenv
python3 -m synapse.app.homeserver --server-name $VIRTUAL_HOST --config-path /synapse/homeserver.yaml --generate-missing-config --report-stats=no
synctl --no-daemonize start /synapse/homeserver.yaml
