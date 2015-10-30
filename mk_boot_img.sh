#!/bin/bash

# Variables
KERNEL=./nuc/mod/kernel
ZIMAGE=./arch/arm/boot/zImage
STOCK_BOOT_IMG=./nuc/boot_stock.img
STOCK_BOOT_FOLDER=./nuc/stock
MOD_BOOT_IMG=./nuc/boot_repack.img
MOD_BOOT_FOLDER=./nuc/mod

# 1.make zImage
make m8_defconfig
make -j4

# 2.clean up
rm -rf $KERNEL $MOD_BOOT_IMG
cp -r $ZIMAGE $KERNEL

# 3.repack mod boot image
./nuc/mkbootimg_tools/mkboot $MOD_BOOT_FOLDER $MOD_BOOT_IMG

# 4.clean up

