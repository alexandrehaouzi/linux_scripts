#!/bin/bash

# REQUIRED: Ubuntu 18.04

echo "############"
echo "# GAMP 0/5 #";
echo "############"

echo "GAMP : UPDATE UBUNTU 18.04"

sudo apt update

echo "GAMP : UPGRADE UBUNTU 18.04"

sudo apt upgrade -y

echo "############"
echo "# GAMP 1/5 #";
echo "############"

echo "GAMP : INSTALL & CONFIG GIT"

sudo apt install git -y

# CONFIGURE GIT ?

read -p 'Git username : ' gitname
git config --global user.name $gitname

read -p 'Git user email : ' gitemail
git config --global user.email $gitemail

git config --global color.ui auto
git config --global merge.conflictstyle diff3

echo "GIT OK..."

echo "############"
echo "# GAMP 2/5 #";
echo "############"

echo "GAMP : INSTALL APACHE2"

sudo apt install apache2 -y
sudo service apache2 restart

echo "APACHE2 OK..."

echo "############"
echo "# GAMP 3/5 #";
echo "############"

echo "GAMP : INSTALL SSH"

sudo apt install ssh

echo "SSH OK..."

echo "############"
echo "# GAMP 4/5 #";
echo "############"

echo "PHP INSTALL"

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-update

read -p 'PHP VERSION (ex : 7.0) : ' phpversion
sudo apt install php$phpversion php$phpversion-{common,mysql,xml,xmlrpc,curl,gd,cli,dev,mbstring,intl,zip} -y

echo "PHP $phpversion OK..." 

echo "############"
echo "# GAMP 5/5 #";
echo "############"

echo "MYSQL INSTALL"

sudo apt install mysql-server -y
sudo mysql_secure_installation

echo "MYSQL OK..."
echo "THINK TO RECONFIGURE THE PASSWORD ROOT"

#read -p "SET A PASSWORD FOR MYSQL ROOT USER : "
#sudo mysql

echo "############"
echo "# GAMP 5/5 #";
echo "############"

echo "PHPMYADMIN INSTALL"

sudo apt install phpmyadmin php-mbstring php-gettext -y
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz
sudo find /usr/share/phpmyadmin -mindepth 1 -delete
sudo tar xf phpMyAdmin-latest-english.tar.xz --strip 1 -C /usr/share/phpmyadmin
sudo chown -R www-data:www-data /usr/share/phpmyadmin

echo "PHPMYADMIN OK..."

echo "############"
echo "# GAMP 5/5 #";
echo "############"

# echo "COMPOSER INSTALL"

# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php')"
# php composer-setup.php --install-dir=/usr/bin

# alias composer "php /usr/bin/composer.phar"
# composer

# echo "COMPOSER OK..."

# echo "############"
# echo "# GAMP 5/5 #";
# echo "############"

# echo "SYMFONY BINARY"

# wget https://get.symfony.com/cli/installer -O - | bash
# mv /home/{$USER}/.symfony/bin/symfony /usr/local/bin/symfony

# echo "SYMFONY OK..."







# echo "1920*1080_dell_change_screen_size"

# SCREEN=$( xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/" )

# gtf 1920 1080 60

# xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
# xrandr --addmode $SCREEN 1920x1080_60.00
# xrandr -s 1920x1080_60.00

# # SAVE FILE WITH CONF

# FILE="/etc/X11/Xsession.d/adapt_resolution.sh"

# if [ ! -f $FILE ];
# then
#     echo "File $FILE not found. Creating File..."
#     sudo touch $FILE
#     echo "File created!"
# else
#     echo "The file $FILE exists."
# fi

# sudo chmod 755 $FILE
# sudo chown $USER:$USER $FILE

# sudo printf 'xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync \n' > $FILE
# sudo printf "xrandr --addmode $SCREEN 1920x1080_60.00 \n" >> $FILE
# sudo printf "xrandr -s 1920x1080_60.00 \n" >> $FILE

# sudo chmod gua+x $FILE

# gnome-session-properties

# echo "Add a name, a description and the path $FILE, validate and reboot :)"
