
#Redirect one specific host
iptables -t nat -A PREROUTING -p tcp --dport <destination port> -d <destination host> -j REDIRECT –to-ports <local port>

#Redirect all host on this target port
iptables -t nat -A PREROUTING -p tcp –dport 8530 -j REDIRECT --to-ports 80






#MASQUERADE (source nat) = replace source ip address with another one
#Everything output on eth0 will be masqueraded
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
