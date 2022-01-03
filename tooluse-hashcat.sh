

#Hash types
#https://hashcat.net/wiki/doku.php?id=example_hashes

# Attack modes
# Dictionary (-a 0) – Reads from a text file and uses each line as a password candidate
# Combination (-a 1) – Like the Dictionary attack except it uses two dictionaries. Each word of a dictionary is appended to each word in a dictionary.
# Mask (-a 3) – Try all combinations in a given keyspace. It is effectively a brute-force on user specified character sets.
# Hybrid (-a 6 and -a 7) – A combination of a dictionary attack and a mask attack.

# Hash types
# 1000  NTLM
# 5600  Net-NTLMv2
# 2100  Domain Cached Credentials 2 (DCC2), MS Cache 2 

hashcat <filehash> <wordlists> -r <rulefile> -a <attackmode> -m <hashtype>  --session <sessionName>


# Examples
# open a screen session
# then launch cracking job with wordlist and rule
hashcat sam.dump /wordlists/Top2Billion_probable.txt -a 0 -m 1000 -r /rules/d3adhob0.rule -O -w 3

#show the password:hashes in potfile
hashcat sam.dump -m 1000  --show


# start cracking job with full combinasion
hashcat sam.dump ?a?a?a?a?a?a?a?a --increment -a 3 -m 1000  -O -w 3



#DPAT
python2 ../DPAT/dpat.py -n ./ntlmUserPasswords.ntlm -c /home/pentest/.hashcat/hashcat.potfile
