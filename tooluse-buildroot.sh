
#Fetch buildroot
git clone https://git.busybox.net/buildroot/

#Set the default settings for arm
make qemu_arm_versatile_defconfig

#Enter menu config
make nconfig
make menuconfig

#Compile everything (toolchain, kernel, rootfs)
make

#Launch the qemu-system
output/images/start-qemu.sh
#OR
qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -nographic

#Target filesystem
ls -l output/target/

#Cross compilation toolchain
output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
