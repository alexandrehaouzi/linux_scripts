#!/bin/bash

# REQUIRED: Ubuntu 18.04

echo "############"
echo "# GAMP 0/6 #";
echo "############"

echo "GAMP : UPDATE UBUNTU 18.04"

sudo apt update

echo "GAMP : UPGRADE UBUNTU 18.04"

sudo apt upgrade -y

echo "############"
echo "# GAMP 1/6 #";
echo "############"

echo "GAMP : INSTALL & CONFIG GIT"

sudo apt install git -y

read -p 'Git username : ' gitname
git config --global user.name $gitname

read -p 'Git user email : ' gitemail
git config --global user.email $gitemail

git config --global color.ui auto
git config --global merge.conflictstyle diff3

echo "GIT OK..."

echo "############"
echo "# GAMP 2/6 #";
echo "############"

echo "GAMP : INSTALL APACHE2"

sudo apt install apache2 -y
sudo service apache2 restart

echo "APACHE2 OK..."

echo "############"
echo "# GAMP 3/6 #";
echo "############"

echo "GAMP : INSTALL SSH"

sudo apt install ssh

echo "SSH OK..."

echo "############"
echo "# GAMP 4/6 #";
echo "############"

echo "PHP INSTALL"

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-update

read -p 'PHP VERSION (ex : 7.0) : ' phpversion
sudo apt install php$phpversion php$phpversion-{common,mysql,xml,xmlrpc,curl,gd,cli,dev,mbstring,intl,zip} -y

echo "PHP $phpversion OK..." 

echo "############"
echo "# GAMP 5/6 #";
echo "############"

echo "MYSQL INSTALL"

sudo apt install mysql-server -y
sudo mysql_secure_installation

echo "MYSQL OK..."
echo "THINK TO RECONFIGURE THE PASSWORD ROOT"

echo "############"
echo "# GAMP 6/6 #";
echo "############"

echo "PHPMYADMIN INSTALL"

sudo apt install phpmyadmin php-mbstring php-gettext -y
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz
sudo find /usr/share/phpmyadmin -mindepth 1 -delete
sudo tar xf phpMyAdmin-latest-english.tar.xz --strip 1 -C /usr/share/phpmyadmin
sudo chown -R www-data:www-data /usr/share/phpmyadmin
sudo rm -r phpMyAdmin-latest-english.tar.xz

echo "PHPMYADMIN OK..."

echo "END GAMP.SH, CIAO!!"
