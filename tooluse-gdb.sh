

#Start gdb
gdb <filepath>

#Attach to running process
(gdb) attach <pid>
#Start new process instance
(gdb) run
#Continue execution after breakpoint pause
(gdb) continue
#Set breakpoint
(gdb) break <line|address>

#Check out the state of the registers
(gdb) info reg
