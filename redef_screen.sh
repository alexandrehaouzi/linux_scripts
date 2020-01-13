#!/bin/bash

echo "1920*1080_dell_change_screen_size"

SCREEN=$( xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/" )

gtf 1920 1080 60

xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
xrandr --addmode $SCREEN 1920x1080_60.00
xrandr -s 1920x1080_60.00

# SAVE FILE WITH CONF

FILE="/etc/X11/Xsession.d/adapt_resolution.sh"

if [ ! -f $FILE ];
then
    echo "File $FILE not found. Creating File..."
    sudo touch $FILE
    echo "File created!"
else
    echo "The file $FILE exists."
fi

sudo chmod 755 $FILE
sudo chown $USER:$USER $FILE

sudo printf 'xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync \n' > $FILE
sudo printf "xrandr --addmode $SCREEN 1920x1080_60.00 \n" >> $FILE
sudo printf "xrandr -s 1920x1080_60.00 \n" >> $FILE

sudo chmod gua+x $FILE

gnome-session-properties

echo "Add a name, a description and the path $FILE, validate and reboot :)"
