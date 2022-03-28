



#redirection tcp connections
	#Intercept this target host:port
	set tcp.address 180.176.33.51
	set tcp.port 443

	#Redirect to this
	set tcp.tunnel.address 127.0.0.1
	set tcp.tunnel.port 443

	#Start proxy
	tcp.proxy on
