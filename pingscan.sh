echo "enter ip/iprange"
read iprange
echo "enter name for output file"
read filename
echo > $filename
for ip in $(nmap -sP -PE -R $iprange|grep "scan report for"|cut -d" " -f5); do
	echo "$ip" >> $filename
done
