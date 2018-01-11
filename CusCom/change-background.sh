#!/bin/bash
if [ "$1" == "--help" ]; then
cat ~/CusCom/HelpFiles/${0##*/}.help
exit
fi
sudo -i
xhost +SI:localuser:lightdm
su lightdm -s /bin/bash
gsettings set com.canonical.unity-greeter draw-user-backgrounds 'true'
gsettings set com.canonical.unity-greeter background '$1'
exit
