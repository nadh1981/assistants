#!/bin/bash

echo "ip address or host please"
read ip
for  script in $(ls -l /usr/share/nmap/scripts/smb*|tr -s " "|cut -d" " -f9);do
	echo "IP - $ip"
	echo "$script"
	echo "$(nmap -v -p 139,445 --script=$script $ip)" >> smb-enum-results.txt
	#echo "$result" >> smb-enum-results.txt
	#echo "--------------------" >> smb-enum-results.txt
done

