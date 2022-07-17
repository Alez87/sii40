#! /usr/bin/env bash

echo "Preparing 3 servers with Zenoh router..."
node1="node1"
api_port1="8001"
port1="7448"
ZBACKEND_FS_ROOT_1="$HOME/.zenoh/zbackend_fs_${node1}"
echo "Creating the $node1 with router Zenoh"
./script_backend_zenoh -n ${node1} -a ${api_port1} -p ${port1} -b ${ZBACKEND_FS_ROOT_1}
echo "Created router Zenoh on node $node"

echo
echo "----------------------------------------------------"
echo

node2="node2"
connection_port2=$port1
api_port2="8002"
port2="7449"
ZBACKEND_FS_ROOT_2="$HOME/.zenoh/zbackend_fs_${node2}"
echo "Creating the $node2 with router Zenoh"
./script_backend_zenoh -n ${node2} -a ${api_port2} -p ${port2} -c ${connection_port2} -b ${ZBACKEND_FS_ROOT_2}
echo "Created router Zenoh on node $node"

echo
echo "----------------------------------------------------"
echo

node3="node3"
connection_port3=$port2
api_port3="8003"
port3="7450"
ZBACKEND_FS_ROOT_3="$HOME/.zenoh/zbackend_fs_${node3}"
echo "Creating the $node3 with router Zenoh"
./script_backend_zenoh -n ${node3} -c ${connection_port3} -a ${api_port3} -p ${port3} -b ${ZBACKEND_FS_ROOT_3}
echo "Created router Zenoh on node $node"

echo
echo "----------------------------------------------------"
echo

# create backend for node1
#curl -X PUT -H 'content-type:application/properties' -d "url=http://localhost:8086" http://localhost:@api_port1/@/router/local/plugin/storages/backend/influxdb
#echo
#echo "Created backend for $node1"
#echo
#echo "----------------------------------------------------"
#echo

# create backend for node2
#curl -X PUT -H 'content-type:application/properties' -d "url=http://localhost:8086" http://localhost:@api_port2/@/router/local/plugin/storages/backend/influxdb
#echo
#echo "Created backend for $node2"
#echo
#echo "----------------------------------------------------"
#echo
