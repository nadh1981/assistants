echo "enter IP range"
read iprange
echo "enter ports to scan"
read portlist
echo "enter name for output file"
read filename
echo > $filename
for ip in  $(nmap -sP -PU$portlist $iprange|grep "scan report for"|cut -d" " -f5); do
	echo "$ip" >>  $filename
done
