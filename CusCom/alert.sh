#/bin/bash
if [ "$1" == "--help" ]; then
cat ~/CusCom/HelpFiles/${0##*/}.help
exit
fi
echo -ne '\a'
while [ true ] ; do
	read -t 0.75 -n 1
	if [ $? = 0 ] ; then
		echo ""
		exit ;
	else
		echo -ne '\a'
	fi
done
