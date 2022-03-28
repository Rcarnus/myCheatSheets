



#Collectors
#Sharphound
#From a non domain machine
runas /netonly /user:CONTOSO\Jeff.Dimmock cmd.exe
#Bloodhound-python
#Through proxychains, request to use dns-tcp, limit to 2 workers
proxychains python3 /opt/outils/windows/bloodhound-python/bloodhound.py -u username -p 'password' -dc srvdc01.domain.com --dns-tcp  -ns 10.176.126.21 -d domain.com -w 2





#Bloodhound Queries
