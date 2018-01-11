#!/bin/bash
if [ "$1" == "--help" ]; then
cat ~/CusCom/HelpFiles/${0##*/}.help
exit
fi
sudo apt-get purge bcmwl-kernel-source
sudo apt-get install firmware-b43-installer
#echo "Your computer will now reboot to install the b43** drivers."
#sleep 5
#sudo shutdown -r now
