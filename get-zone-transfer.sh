#!/bin/bash

echo "enter host/ip"

read host

for server in $(host -t ns $host|cut -d" " -f4);do
#echo "$host"
#echo "$server"
host -l $host $server|grep "has address"
done
