
#Zigbee security model
#https://research.kudelskisecurity.com/2017/11/08/zigbee-security-basics-part-2/

#Implementation and protocol vulnerabilities of zigbee
#https://research.kudelskisecurity.com/2017/11/21/zigbee-security-basics-part-3/

#Sniff with CC2531
#https://github.com/andrebdo/wireshark-cc2531.git
#Open Wireshark's preferences and select 'TI CC24xx FCS format' under Protocols -> IEEE 802.15.4

#API-mote
#https://www.willhackforsushi.com/presentations/toorcon11-wright.pdf
#check device presence and device interface
sudo zbid
#discover zigbee routers, modes, PAN IDs (networks) and channels used
sudo zbstumbler -v -i /dev/ttyUSB0
#Sniff traffic on channel X
sudo zbwireshark -i /dev/ttyUSB0 -c X

#Capture the pairing of a node into the network
#Look for "ZigBee	APS: Command"
#See Annex 7:
#https://www.hkcert.org/f/blog/264453/3a1c8eed-012c-4b59-9d9e-971001d66c77-DLFE-14602.pdf
#Configure wireshark:
#https://community.oh-lalabs.com/t/guide-build-a-zigbee-cc2531-sniffer-how-to-use-it/469

#Default global trust center key
#ZigbeeAlliance9
5a6967426565416c6c69616e63653039
00000000000000000000000000000000
00000000000000000000000000000001
#light link commissioning key
814286865DC1C8B2C8CBC52E5D65D1B8 
#ZLL Master Key
9F5595F10257C8A469CBF42BC93FEE31
