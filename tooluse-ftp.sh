
# Plain FTP

###https://hackviser.com/tactics/pentesting/services/ftp

nmap -p 21 --script ftp-features <target-ip>

$ ftp X.X.X.X
###provide anonymous as username
###provide any password
Connected to X.X.X.X.
220 Serv-U FTP Server v6.3 for WinSock ready...
Name (X.X.X.X:root): anonymous
331 User name okay, please send complete E-mail address as password.
Password:
230 User logged in, proceed.
Remote system type is UNIX.
Using binary mode to transfer files.
### List files (This can take a while):
### Data is received over a different TCP connection (filter by ftp-data in wireshark)
ftp> ls
227 Entering Passive Mode (184,95,225,100,21,124)
150 Opening ASCII mode data connection for /bin/ls.
drw-rw-rw-   1 user     group           0 Sep 14  2016 .
drw-rw-rw-   1 user     group           0 Sep 14  2016 ..
drw-rw-rw-   1 user     group           0 Sep 16  2016 aastra
drw-rw-rw-   1 user     group           0 May 19 04:04 archives
drw-rw-rw-   1 user     group           0 May 20 04:01 config
226 Transfer complete.

### Same thing with lftp:
root@RomDroplet-Ubuntu-DO:~/Cerbexa_Lemay_External# lftp ftp://anonymous:@184.95.225.100:21 -e "set ssl:verify-certificate no"
lftp anonymous@184.95.225.100:~> ls
ls at 0 [Making data connection...]
drw-rw-rw-   1 user     group           0 Sep 14  2016 .
drw-rw-rw-   1 user     group           0 Sep 14  2016 ..
drw-rw-rw-   1 user     group           0 Sep 16  2016 aastra
drw-rw-rw-   1 user     group           0 May 23 04:05 archives
drw-rw-rw-   1 user     group           0 May 23 04:01 config

### Retrieve the content of the remote folder recursively:
wget -m ftp://anonymous:*password*@X.X.X.X/



# FTP over SSH
sftp -P 990 X.X.X.X


# FTP over SSL (classic port 990)
lftp ftps://anonymous:anonymous@184.95.225.100:990 -e "set ssl:verify-certificate no"
lftp anonymous@184.95.225.100:~> ls
ls: Login failed: 530 User cannot log in.

