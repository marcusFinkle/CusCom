#!/bin/bash
if [ "$1" == "--help" ]; then
cat ~/CusCom/HelpFiles/${0##*/}.help
exit
fi
if [ $(pv --help 2>&1 | grep "is") == "The program 'pv' is currently not installed. You can install it by typing:"]; then echo "This script requires the program 'pv' to be installed. To use, please install it. Terminating." && exit 1
fi
zero == true
lsblk
echo "What device do you want to clone? (Must be preceeded by /dev/, ex. sdc1 would be /dev/sdc1)"
read dev
echo "What device do you want to clone to? (Must be preceeded by /dev/, ex. sdc1 would be /dev/sdc1.)"
read dev2
sudo blockdev --getsize64 $dev > size.temp
size=`cat size.temp`
rm size.temp
sudo blockdev --getsize64 $dev2 > size.temp
size2=`cat size.temp`
rm size.temp
if [ $size > $size2 ]; then
echo "Device being cloned is larger than device being cloned to."
echo "Aborting to prevent Kernel Panic and potential data loss."
exit 1
fi
echo "Cloning..." && sudo dd if=$dev | pv --size ${size} | sudo dd of=$dev2
echo "Complete. $dev2 now looks exactly like $dev!"
