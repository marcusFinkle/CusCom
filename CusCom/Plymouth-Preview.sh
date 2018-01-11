sleepvar=$1
if [ -z $1 ]; then
sleepvar=10
fi
if [ "$1" == "--help" ]; then
cat ~/CusCom/HelpFiles/${0##*/}.help
exit
fi
sudo plymouthd
sudo plymouth --show-splash
sleep $sleepvar
sudo killall -9 plymouthd
