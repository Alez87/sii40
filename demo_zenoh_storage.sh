#! /usr/bin/env bash

demo_db1="example10"
api_port1="8001"
curl -X PUT -H 'content-type:application/properties' -d "path_expr=/demo/example/**;path_prefix=/demo/example;on_closure=drop_series;db=${demo_db1};create_db" http://localhost:${api_port1}/@/router/local/plugin/storages/backend/influxdb/storage/example
echo
echo "Created storage for node1 on influxdb database ${demo_db1}"
echo
echo "----------------------------------------------------"
echo

demo_db2="example11"
api_port2="8002"
curl -X PUT -H 'content-type:application/properties' -d "path_expr=/demo/example/**;path_prefix=/demo/example;on_closure=drop_series;db=${demo_db2};create_db" http://localhost:${api_port2}/@/router/local/plugin/storages/backend/influxdb/storage/example
echo
echo "Created storage for node2 on influxdb database ${demo_db2}"
echo
echo "----------------------------------------------------"
echo
