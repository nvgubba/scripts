#!/bin/bash

#####################################################
#  [EVB]
####################################################
target=rhea-evb-cli-initramfs.yml
#target=rhea-evb-cli-initramfs-rtspcam.yml

#####################################################
#  [FPGA]
####################################################
#target=rhea-fpga-cli-initramfs.yml
#target=rhea-fpga-cli-initramfs-rtspcam.yml
#[kernel build]
#danniebuild.sh compile virtual/kernel
#[kernel clean]
#danniebuild.sh cleanall virtual/kernel
#[u-boot build]
#danniebuild.sh compile u-boot


echo "--------------------------------------------------------------"
echo -e " Current target is\033[32m $target \033[0m"
echo " Press any key to continue..."
echo "--------------------------------------------------------------"

read

# Check if no arguments are provided
if [ $# -eq 0 ]; then
  # If no arguments, run make -C all
  kas build freedom-u-sdk/scripts/kas/$target
else
    if [ "$1" == "cleanall" ]; then
      kas shell freedom-u-sdk/scripts/kas/$target -c "bitbake -c cleanall $2"
	elif [ "$1" == "clean" ]; then
	  kas shell freedom-u-sdk/scripts/kas/$target -c "bitbake -c clean $2"
    elif [ "$1" == "compile" ]; then
      kas shell freedom-u-sdk/scripts/kas/$target -c "bitbake -C compile $2"
    elif [ "$1" == "menuconfig" ]; then
      kas shell freedom-u-sdk/scripts/kas/$target -c "bitbake -c menuconfig $2"
	elif [ "$1" == "env" ]; then
	  kas shell freedom-u-sdk/scripts/kas/$target -c "bitbake -e $2 | grep $3"
    else
	  kas shell freedom-u-sdk/scripts/kas/$target -c "bitbake $1 -v"
    fi
fi
