echo "enter IP range"
read iprange
echo "enter ports to scan"
read portlist
echo "enter name for output file"
read filename
echo > $filename
nmap -sP -PS$portlist $iprange -oG $filename
# for ip in  $(nmap -sP -PS$portlist $iprange|grep "scan report for"|cut -d" " -f5); do
# 	echo "$ip" >>  $filename
# done
