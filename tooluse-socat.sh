

#listen on tcp/1233 and forward messages to tcp:address:port
sudo socat tcp-listen:1233,fork,reuseaddr TCP:127.0.0.1:1234
#do the same and print the messages on screen
sudo socat -v tcp-listen:1233,fork,reuseaddr TCP:127.0.0.1:1234

#listen on tcp/ssl/1233 and forward messages to tcp:address:port
sudo socat openssl-listen:1233,fork,reuseaddr TCP:127.0.0.1:1234

