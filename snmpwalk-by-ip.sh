#!/bin/bash

echo "Enter ip address"
read ip
echo "Enter community"
read community
echo "enter snmp version"
read snmpversion
echo "Choose one from bleow"
echo "1 >> 1.3.6.1.2.1.25.1.6.0 - System Processes"
echo "2 >> 1.3.6.1.2.1.25.4.2.1.2 - Running Programs"
echo "3 >> 1.3.6.1.2.1.25.4.2.1.4 - Processes Path"
echo "4 >> 1.3.6.1.2.1.25.2.3.1.4 - Storage Units"
echo "5 >> 1.3.6.1.2.1.25.6.3.1.2 - Software Name"
echo "6 >> 1.3.6.1.4.1.77.1.2.25 - User Accounts"
echo "7 >> 1.3.6.1.2.1.6.13.1.3 -  TCP Local Ports"
read choice

case $choice in
"1" )
	mib=1.3.6.1.2.1.25.1.6.0
	filter="system-processes"
	;;
"2" )
	mib="1.3.6.1.2.1.25.4.2.1.2"
	filtere="reunning-programs"
	;;
"3" )
	mib=="1.3.6.1.2.1.25.4.2.1.4"
	filter="process-path"
	;;
"4" )
	mib="1.3.6.1.2.1.25.2.3.1.4"
	filter="storage-units"
	;;
"5" )
	mib="1.3.6.1.2.1.25.6.3.1.2"
	filter="software-names"
	;;
"6" )
	mib="1.3.6.1.4.1.77.1.2.25"
	filter="user-accounts"
	;;
"7" )
	mib="1.3.6.1.2.1.6.13.1.3"
	filter="tcp-local-ports"
	;;
esac

echo > "$ip-$filter"
for line in $(snmpwalk -c  $community -"$snmpversion" $ip $mib);do
	echo $line >> "$ip-$filter"
done
