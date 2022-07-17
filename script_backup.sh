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

create backend for node1
#curl -X PUT -H 'content-type:application/properties' http://localhost:$api_port1/@/router/local/plugin/storages/backend/fs
curl -X PUT -H 'content-type:application/properties' -d "url=http://localhost:8086" http://localhost:@api_port1/@/router/local/plugin/storages/backend/influxdb
echo
echo "Created backend for $node1"
echo
echo "----------------------------------------------------"
echo

create backend for node2
#curl -X PUT -H 'content-type:application/properties' http://localhost:$api_port2/@/router/local/plugin/storages/backend/fs
curl -X PUT -H 'content-type:application/properties' -d "url=http://localhost:8086" http://localhost:@api_port2/@/router/local/plugin/storages/backend/influxdb
echo
echo "Created backend for $node2"
echo
echo "----------------------------------------------------"
echo

#ZENOH_PYTHON_HOME="../zenoh-examples-python"
#router1_address="tcp/127.0.0.1:$port1"
#router2_address="tcp/127.0.0.1:$port2"

#id="local"
#path_expr="/demo/example/**"
#path_prefix="/demo/example"
#storage_folder="fs_storage"
#name="example"

#echo "$ZENOH_PYTHON_HOME/z-storage-add-client.py $router1_address $id $name $path_expr $path_prefix $storage_folder"
#python $ZENOH_PYTHON_HOME/z-storage-add-client.py $router1_address $id $name $path_expr $path_prefix $storage_folder

#echo
#echo "Created storage for $node1 on folder $storage_folder"
#echo
#echo "----------------------------------------------------"
#echo

#client1_locator="/demo/example/test"
#client1_value="Example_string"
#echo "$ZENOH_PYTHON_HOME/z-put-client.py $router1_address $client1_locator $client1_value"
#python $ZENOH_PYTHON_HOME/z-put-client.py $router1_address $client1_locator $client1_value

#echo
#echo "Data $client1_value inserted to $node1"
#echo
#echo "----------------------------------------------------"
#echo

#path_expr="/demo/example/edge1"

#create storage for node2
#echo "$ZENOH_PYTHON_HOME/z-storage-add-client.py $router2_address $id $name $path_expr $path_prefix $storage_folder"
#python $ZENOH_PYTHON_HOME/z-storage-add-client.py $router2_address $id $name $path_expr $path_prefix $storage_folder

#curl -X PUT -H 'content-type:application/properties' -d "path_expr=/demo/example/**;path_prefix=/demo/example;dir=$storage_folder" http://localhost:$api_port2/@/router/local/plugin/storages/backend/fs/storage/example
#echo
#echo "Created storage for $node2 on folder $storage_folder"
#echo
#echo "----------------------------------------------------"
#echo

#echo
#echo "Data from $router1_address:"
#python $ZENOH_PYTHON_HOME/z-admin.py $router1_address
#echo
#echo "----------------------------------------------------"
#echo

#echo
#echo "Data from $router2_address:"
#python $ZENOH_PYTHON_HOME/z-admin.py $router2_address
#echo
#echo "----------------------------------------------------"
#echo
