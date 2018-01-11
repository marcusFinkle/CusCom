#if [ -f "/dev/mmcblk0p1" ]; then echo "SD Card is in SD slot."
#echo "Attempting to mount SD card on /dev/mmcblk0p1..."
#echo "An error has occurred, error code 420, \"No Implementation of requested operation.\" Please try again."
#else echo "There is no SD card inserted to mount. Please insert a SD card, and try again."
sudo mount -t vfat /dev/mmcblk0p1 /media/16GBSD
#fi

