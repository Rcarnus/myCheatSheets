


#Connect to Serial
screen /dev/ttyUSB0 115200
screen /dev/ttyUSB0 9600
#To kill session
<Ctrl-A> k # then y
#To exit from session
<Ctrl-A> :quit
#To detach from session
<Ctrl-A> d


screen -ls
screen -r <sessionName>


#Capture current screen to file:
<Ctrl-A> H
#it saves to a file in the local directory

#Capture everything to logfile
screen -L -Logfile ./screenUboot.out /dev/ttyUSB0 115200
