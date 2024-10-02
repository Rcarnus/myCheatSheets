



#Collectors
#Sharphound
#From a non domain machine
runas /netonly /user:CONTOSO\Jeff.Dimmock powershell.exe
. .\SharpHound.ps1
Invoke-BloodHound -CollectionMethod All -JSONFolder "c:\experiments\bloodhound"
#Bloodhound-python
#Through proxychains, request to use dns-tcp, limit to 2 workers
proxychains python3 /opt/outils/windows/bloodhound-python/bloodhound.py -u username -p 'password' -dc srvdc01.domain.com --dns-tcp  -ns 10.176.126.21 -d domain.com -w 2


#Initial Setup
#https://www.ired.team/offensive-security-experiments/active-directory-kerberos-abuse/abusing-active-directory-with-bloodhound-on-kali-linux
#Launch Bloodhound
sudo neo4j start
bloodhound
#Bloodhound Queries
