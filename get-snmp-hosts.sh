#!/bin/bash

echo "Enter ip range"
read iprange
echo "Output file name"
read outputfile

tempoutputfile="temp-$outputfile"
nmap -sU --open -p 161 $iprange -oG $tempoutputfile
echo > $outputfile
for ip in $(cat $tempoutputfile|grep "161/open"|cut -d" " -f2);do
	echo $ip  >> $outputfile
done
#rm $tempoutputfile
