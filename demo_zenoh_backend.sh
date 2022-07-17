#! /usr/bin/env bash

api_port1="8001"
echo ${api_port1}

# create backend for node1
curl -X PUT -H 'content-type:application/properties' -d "url=http://localhost:8086" http://localhost:${api_port1}/@/router/local/plugin/storages/backend/influxdb
echo
echo "Created backend for node1 through api port ${api_port1}"
echo
echo "----------------------------------------------------"
echo

api_port2="8002"
# create backend for node2
curl -X PUT -H 'content-type:application/properties' -d "url=http://localhost:8086" http://localhost:${api_port2}/@/router/local/plugin/storages/backend/influxdb
echo
echo "Created backend on node2 through api port ${api_port2}"
echo
echo "----------------------------------------------------"
echo
