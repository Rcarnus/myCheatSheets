

#Start VPN with config file
sudo wg-quick up polarseclab_wg.conf
#Stop VPN with config file
sudo wg-quick down ./polarseclab_wg.conf


[Peer]
PublicKey = ...
PresharedKey = ...
Endpoint = polarsecvpn.duckdns.org:51820
# By default 0.0.0.0 means that all traffic will go through the VPN
AllowedIPs = 0.0.0.0/0, ::0/0
# If you want only one host or network edit this line
AllowedIPs = 192.168.0.125/32
