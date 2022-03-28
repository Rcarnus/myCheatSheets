
#Redirect one specific host
iptables -t nat -A PREROUTING -p tcp --dport <destination port> -d <destination host> -j REDIRECT –to-ports <local port>

#Redirect all host on this target port
iptables -t nat -A PREROUTING -p tcp --dport 8530 -j REDIRECT --to-ports 80


# Populate secondary routing table
ip route add default via <wlangw> dev wlan0 table wlan-route
# Anything with this fwmark will use the secondary routing table
ip rule add fwmark 0x1 table wlan-route
ip rule add fwmark 0x2 table wlan-route
# Mark these packets so that iproute can route it through wlan-route
iptables -A OUTPUT -t mangle -o eth1 -p tcp --dport 80 -j MARK --set-mark 1
iptables -A OUTPUT -t mangle -o eth1 -p tcp --dport 443 -j MARK --set-mark 2
# now rewrite the src-addr
iptables -A POSTROUTING -t nat -o wlan0 -p tcp --dport 80 -j SNAT --to <wlan0IP>
iptables -A POSTROUTING -t nat -o wlan0 -p tcp --dport 443 -j SNAT --to <wlan0IP>

pentest@wifipi-1:~$ curl ifconfig.me
76.250.189.186
pentest@wifipi-1:~$ curl https://ifconfig.me
23.122.130.185





#MASQUERADE (source nat) = replace source ip address with another one
#Everything output on eth0 will be masqueraded
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


