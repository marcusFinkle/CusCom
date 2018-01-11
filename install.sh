#!/bin/bash
echo "Thank you for downloading the CusCom library. Installation will begin shortly."

mv -r CusCom $HOME/CusCom

echo "Would you like to be able to call scripts from the command line? [Y/N]"
read -n 1 callScripts
if [ "$callScripts" == "Y" ]
then echo "source $HOME/CusCom/.aliases" >> ~/.bashrc
elif [ "$callScripts" == "y" ]
then echo "source $HOME/CusCom/.aliases" >> ~/.bashrc
fi
echo "Installation complete."
exit
