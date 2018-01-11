#!/bin/bash
if [ "$1" == "--help" ]; then
cat ~/CusCom/HelpFiles/${0##*/}.help
exit
fi
sudo update-burg
sudo sed -i -e '/^[^#]/ s/Ubuntu GNU\/Linux, with Linux 4.2.0-27-generic/Ubuntu 14.04/' /boot/burg/burg.cfg
