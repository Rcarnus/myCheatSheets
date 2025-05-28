


#ASPNET cryptography
#https://blog.liquidsec.net/2021/06/01/asp-net-cryptography-for-pentesters/

"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\aspnet_regiis.exe" -pef "connectionStrings" "C:\Program Files (x86)\BLAH\MYAPP" -prov "DataProtectionConfigurationProvider"
C:\Windows\System32\inetsrv\appcmd.exe list apppools
C:\Windows\System32\inetsrv\appcmd.exe list apppools <apppool> /text:*
C:\Windows\System32\inetsrv\appcmd.exe list vdirs
C:\Windows\System32\inetsrv\appcmd.exe list vdirs <dirname>/ /text:*


"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\aspnet_regiis.exe" -pd "connectionStrings" -app "/MYAPP"
