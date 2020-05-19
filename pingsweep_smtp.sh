#!/bin/bash

echo Hello... IP and Range please

read ip

nmap -sn $ip|grep "Nmap scan report for"|cut -d " " -f 5|sort -n >> pingsweep.txt