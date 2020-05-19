#!/bin/bash

if [ -z "$1" ]; then
	echo "[*] Simple shell to network sweep by range"
	echo "[*] Usage: $0 <ip address range as **.**.**.**-***>"
	exit 0
fi

nmap -sn $1|grep "scan report for"| cut -d" " -f5