

#This is how to bridge:
brctl addbr br0
brctl show
brctl addif br0 eth1
brctl addif br0 eth2

ifconfig br0 up
dhclient br0
#Now, the problem with briding comes when you want to intercept trafic, like with iptables
iptables -t nat -A PREROUTING -p tcp --dport 123 -d 13.88.240.183 -j REDIRECT --to-ports 123
#Theoritically the iptables rules are applied on bridging if you tell ebtables to use the DROP rule
echo "0" > /proc/sys/net/bridge/bridge-nf-call-iptables
ebtables-legacy -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp --ip-dport 123 -j redirect --redirect-target DROP
#But this does not seem to work






#Another way to do it, is with natting the output trafic:
#Start a dhcpd on the internal interface:
vi /etc/dhcp/dhcpd.conf
dhcpd eth2
#Then nat the output trafic:
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
#Then add your redirection rules as usual:
iptables -t nat -A PREROUTING -p tcp --dport 123 -d 13.88.240.183 -j REDIRECT --to-ports 123

