
#https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842223/U-boot?view=blog


#get configuration of uboot
printenv

#attempt to ping host on network
ping 192.168.13.92
#modify env variable
setenv serverip 192.168.13.92

#get info about partitions
mtdparts
flpart
#info about board
bdinfo

#Dump content of memory
md.b


#Dump firmware from u-boot
#https://cybergibbons.com/hardware-hacking/recovering-firmware-through-u-boot/
#Option 1: use mb.d
#read from flash to memory address
nand read <targetAddressInRam> <fromAddrInNand> <NumberOfBytes>
#read from memory address to screen
md.b <FromAddrInRAM> <NumberOfBytes>

device nand0 <gpmi-nfc-main>, # parts = 5
 #: name                size            offset          mask_flags
 0: Bstrm-U-Boot        0x00300000      0x00000000      0
 1: NVRAM               0x00080000      0x00300000      0
	nand read 0x00500000 0x00300000 1000
	md.b 0x00500000 1000
 2: Kernel              0x00500000      0x00380000      0
	nand read 0x00500000 0x00380000 1000
	md.b 0x00500000 1000
 3: RootFS              0x07300000      0x00880000      0
	nand read 0x00500000 0x00880000 100000
	md.b 0x00500000 100000
 4: UserFS              0x00480000      0x07b80000      0
	nand read 0x00500000 0x07b80000 1000
	md.b 0x00500000 1000
	User FS is empty

tr -d '\r' < screenUboot.out > screenUboot2.out
python3 /opt/outils/hardware/uboot-mdb-dump/uboot_mdb_to_image.py < screenUboot2.out > tempFlash.bin

#Option 2: using TFTP
nand read 0x300000 0x07b80000 0x00480000
#Prepare tftp on kali
sudo systemctl start atftpd.service
cd /srv/tftp
sudo touch firmware.bin
sudo chmod 666 firmware.bin
#Back on uboot:
tftp 0x300000 firmware.bin 0x00480000
#tftpboot command will not allow to upload files

#Option 2: modify boot arguments
