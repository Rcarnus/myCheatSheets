
#https://book.hacktricks.xyz/network-services-pentesting/5671-5672-pentesting-amqp

nmap -sV -Pn -n -T4 -p 5672 --script amqp-info <IP>


vi get.sh
#!/bin/bash
read line
echo $line

amqp-consume --url amqp://guest:guest@<IP> -q sensors ./get.sh

#Python:
import amqp
#Or
import pika


python3 -m cotopaxi.service_ping --protocol AMQP 192.168.227.128 5672



#https://github.com/cr0hn/enteletaor.git
