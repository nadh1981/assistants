#!/bin/bash

if [ -z "$1" ]; then
	echo "[*] Simple shell to cleare ip table for give ip"
	echo "[*] Usage: $0 <ip address>"
	exit 0
fi

#reset all counters and iptable rules
iptables -Z && iptables -F

#measure incoming traffic on $1
iptables -I INPUT 1 -s $1 -j ACCEPT

#measure outgoing traffic from $1
iptables -I OUTPUT 1 -d $1 -j ACCEPT