#!/bin/bash
if [ "$1" == "--help" ]; then
cat ~/CusCom/HelpFiles/${0##*/}.help
exit
fi
if [ $(pv --help 2>&1 | grep "is") == "The program 'pv' is currently not installed. You can install it by typing:"]; then echo "This script requires the program 'pv' to be installed. To use, please install it. Terminating." && exit 1
fi
zero == true
lsblk
echo "What device do you want to overwrite? (Must be full device path, ex. /dev/sdc1)"
read dev
sudo blockdev --getsize64 $dev > size.temp
size=`cat size.temp`
rm size.temp
if [ $dev -eq "/dev/sda" ]; then
echo "Failsafe says no."
exit 1
elif [ $dev -eq "/dev/sda1" ]; then
echo "Failsafe says no."
exit 1
elif [ $dev -eq "/dev/sda2" ]; then
echo "Failsafe says no."
exit 1
fi
echo "Would you like to zero the device $dev or overwrite it with garbage data? (Zeroing is faster) [Z,g]"
read ovr
if [ $ovr == z ] 
then $zero == true 
elif [ $ovr == Z ] 
then $zero == true
elif [ $ovr == g ] 
then $zero == false
elif [ $ovr == G ] 
then $zero == false
else echo "Invalid. Defaulting to zeroing..."
fi
if [ $zero == true ]
then echo "Zeroing..." && sudo dd if=/dev/zero | pv --size ${size} | sudo dd of=$dev
else echo "Overwriting..." && sudo dd if=/dev/urandom | pv --size ${size} | sudo dd of=$dev
fi
