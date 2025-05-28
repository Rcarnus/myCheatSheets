

Setting up QEMU Image
Create raw image:

qemu-img create -f raw ext4s 400M

Create one partition with sdfisk:

sfdisk ext4s
ext4s1:start=63, size=300M, type=83
write
Format the partition to Ext4 fs in gparted

sudo losetup /dev/loop7 ext4s 
sudo gparted /dev/loop7
Extract the SquashFS from the decrypted firmware images

dumpimage -p 4 -T flat_dt -o root.squashfs.padded blah-coucou-9.1.2.1-468154.img

Mount and unpack squashfs

mkdir os/
sudo mount /dev/loop7p1 os/
Login as root to make changes

sudo -i
cd os
unsquashfs ../root.squashfs.padded
Modify the etc/inittab, etc/inittab.console and etc/inittab.no-console file to:

# Copyright (c) 2013 The Linux Foundation. All rights reserved.
::sysinit:/etc/init.d/rcS S boot
::shutdown:/etc/init.d/rcS K shutdown
ttyAMA0::askfirst:/usr/libexec/login.sh
ttyS0::askfirst:/usr/libexec/login.sh
hvc0::askfirst:/usr/libexec/login.sh
Once done

cd ../
sudo umount os/
sudo losetup -d /dev/loop7



