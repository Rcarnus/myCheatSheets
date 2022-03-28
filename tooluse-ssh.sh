
#Local port forwarding
#open a port on the local machine
ssh -L 80:intra.example.com:80 gw.example.com


#Remote port forwarding
#open a port on the remote machine
ssh -R 8080:localhost:80 public.example.com


#Dynamic port forwarding
ssh -D 1337 -q -C -N user@remotemachine.com
