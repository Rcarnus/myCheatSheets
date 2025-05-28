
#On older systems:
cat /etc/resolv.conf
#On latest Ubuntu versions:
resolvectl status

#Normal DNS request
dig google.com
#Request any types of records
dig niamsys.tech ANY
#Specify the nameserver
dig @8.8.8.8 google.com
