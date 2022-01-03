
#Summary of TPM attacks
https://blog.elcomsoft.com/2021/01/understanding-bitlocker-tpm-protection/


#Check for TPM vulnerabilities
#napper CVE-2018-6622 plus unknown CVE
#CVE-2020-0526 for intel PTT (fTPM)
#CVE-2018-6622 for the SRTM and CVE-2017-16837 for the DRTM
https://github.com/kkamagui/napper-for-tpm
https://www.youtube.com/watch?v=EXyDAWWHeYY
#https://i.blackhat.com/eu-19/Thursday/eu-19-Han-BitLeaker-Subverting-BitLocker-With-One-Vulnerability.pdf
#https://www.usenix.org/system/files/conference/usenixsecurity18/sec18-han.pdf

#Bitleaker
https://github.com/kkamagui/bitleaker


#TPM tools
#Multi-purpose tools for tpm2 chips
https://github.com/ionescu007/tpmtool



=====================

#Sniff communication with the TPM
#can only be made if using a dTPM ?
#[2019] https://pulsesecurity.co.nz/articles/TPM-sniffing
#[2020] https://labs.f-secure.com/blog/sniff-there-leaks-my-bitlocker-key/
#[2021] https://dolosgroup.io/blog/2021/7/9/from-stolen-laptop-to-inside-the-company-network
#[2021] https://blog.scrt.ch/2021/11/15/tpm-sniffing/

#Prepare the ice40 stick
#Modify the EEPROM of the ice40 stick
#can be done with FTProg
#https://ftdichip.com/wp-content/uploads/2021/05/FT_Prog_v3.12.11.594%20Installer.zip
#modify EEPROM of the FTDI and enable OPTO mode on Channel B

#build lpc_sniffer_tpm
#https://github.com/denandz/lpc_sniffer_tpm
apt install yosys arachne-pnr
make
#Program the ice40 stick
sudo make install

#Wire up the stick with the LPC bus of the target



=====================
Less interesting ones

#Return of Coppersmith's Attack (ROCA) _ CVE-2017-15361
#Infineon TPM 1.2 chips. Permettrait de casser des clés RSA générées par le TPM
#bof. compliqué à exploiter. pourrait permettre de recalculer le motif d'intégrité du bootloader peut etre.
# https://crocs.fi.muni.cz/public/papers/rsa_ccs17


# TPM fail
# CVE-2019-11090 for Intel fTPM vulnerabilities and CVE-2019-16863 for STMicroelectronics TPM chip. 
# https://tpm.fail/


=====================
MISC

#Background knowledge on TPMs
#https://docs.microsoft.com/en-us/windows/security/information-protection/tpm/tpm-fundamentals
#https://docs.microsoft.com/en-us/windows/security/information-protection/tpm/trusted-platform-module-top-node
#https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-countermeasures#attacker-with-skill-and-lengthy-physical-access
