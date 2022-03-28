


#S4U2Self
#Service for User to (my)Self
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-sfu/02636893-7a1f-4357-af9a-b672e3e3de13
The S4U2self extension allows a service to obtain a service ticket to itself on behalf of a user.
#A service can obtain a TGS to itself as any user
-> User identity and TGT of service (allowed to performed s4u2self)
<- TGS to the service on behalf of the requested User


#S4U2Proxy
#Service for User to Proxy
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-sfu/bde93b0e-f3c9-4ddf-9f44-e1453be7af5a
The S4U2proxy extension provides a service that obtains a service ticket to another service on behalf of a user.
#A service account can obtain a TGS to another service on behalf of a user, using a forwardable TGS
-> 


#Unconstrained Delegation






#Resource Based Constrained Delegation
msDS-AllowedToActOnBehalfOfOtherIdentity

