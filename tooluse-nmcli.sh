
#show connections
nmcli con

#show details about one connection
nmcli con show "Wired connection 1"

#rename con profile
sudo nmcli connection mod "Wired connection 1" connection.id "auto_eth0"

#setup manually the dns servers
nmcli con mod auto_eth0 ipv4.dns "8.8.8.8 8.8.4.4"
nmcli con mod auto_eth0 ipv4.ignore-auto-dns yes

#activate network profile auto_eth0
sudo nmcli con up auto_eth0

#setup manually the interface
sudo nmcli con mod eth0_manual ipv4.addresses 192.168.0.31/24 ipv4.gateway 192.168.0.1 ipv4.dns "8.8.8.8 8.8.4.4" ipv4.method manual

#add a static rule
sudo nmcli con mod eth0_manual +ipv4.routes "10.10.1.0/24 192.168.0.40"

