#!/bin/bash

echo "Enter ip range"
read iprange
echo "Enter port number/s"
read ports
echo "Enter filter string"
read filterstring
echo "Output file name"
read outputfile

tempoutputfile="temp-$outputfile"
nmap -sU --open -p $ports $iprange -oG $tempoutputfile
echo > $outputfile
for ip in $(cat $tempoutputfile|grep "$filterstring"|cut -d" " -f2);do
	echo $ip  >> $outputfile
done
#rm $tempoutputfile
