clear
echo ""
rec=benlaroe@att.net
cd /media/kenny-ray/EXT\ SPACE/RPG_Stuff
echo "Removing old..."
rm The_Paladin_of_Death_Storyline_Mac.txt
echo "Converting Linux line endings into Mac line endings..."
tr '\n' '\r' < The_Paladin_of_Death_Storyline.txt > The_Paladin_of_Death_Storyline_Mac.txt
echo "Sending script to benlaroe@att.net..."
echo "Here you go. Sent by Karmel Studios Automated e-Mail program v. 1.01" | mail \
-s "Paladin of Death Current Script" \
-r "krlegoboy@gmail.com" \
-a "The_Paladin_of_Death_Storyline_Mac.txt" \
-S smtp="smtp.gmail.com:587" \
-S smtp-use-starttls \
-S smtp-auth-login \
-S smtp-auth-user="spam4kr@gmail.com" \
-S smtp-auth-password="Meowman1234" \
-S ssl-verify-ignore \
-v $rec
if [ "$?" -eq "0" ]; then
echo "Current TPoD Script sent to $rec."
else
echo "Script failed to send. Please refer to above error message for more info."
echo "Diagnosing..."
~/CusCom/nettest
if [ "$?" -ne "0" ]; then
echo "Check your internet connection."
exit 1
else echo "Unknown error."
exit 5
fi
fi
