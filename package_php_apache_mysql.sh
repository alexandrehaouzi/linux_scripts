#!/bin/bash

# REQUIRED: Ubuntu 20.04

# Vars 
RED = `tput setaf 1`
GREEN = `tput setaf 2`
NC = `tput sgr0`

echo "#############"
echo "# GIT - 1/5 #"
echo "#############"
echo -e "/r/n/r/n"

read -p 'Git username : ' gitname
git config --global user.name $gitname

read -p 'Git user email : ' gitemail
git config --global user.email $gitemail

git config --global color.ui auto
echo -e "Git color.ui is OK ${GREEN}✔${NC} /r/n"

git config --global merge.conflictstyle diff3
echo -e "Git merge.conflictstyle is OK ${GREEN}✔${NC} /r/n"
echo -e "Git is configured now ${GREEN}✔${NC} /r/n"
echo -e "/r/n/r/n"

echo "#################"
echo "# APACHE2 - 2/5 #"
echo "#################"

echo -e "/r/n/r/n"

sudo apt install apache2 -y
echo -e "Apache2 is now installed ${GREEN}✔${NC} /r/n"

sudo service apache2 restart
echo -e "Apache2 is now running ${GREEN}✔${NC} /r/n"

echo "#############"
echo "# PHP - 3/5 #";
echo "############""

echo -e "/r/n/r/n"

sudo apt install ssh
echo -e "SSH is now installed ${GREEN}✔${NC} /r/n"

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php

echo -e "Add repository apt ➝ ppa:ondrej/php /r/n"

sudo apt-update

echo "Aptitude is update ${GREEN}✔${NC} /r/n"

read -p 'What version of php do yoy want to install ? (example : ${GREEN}7.4${NC}) : ' phpversion
sudo apt install php$phpversion php$phpversion-{common,mysql,xml,xmlrpc,curl,gd,cli,dev,mbstring,intl,zip,gmp,bcmath,gettext} libapache2-mod-php$phpversion -y
echo -e "PHP $phpversion is now installed ${GREEN}✔${NC} /r/n"
echo -e "Modules installed : /r/n"
echo -e "php$phpversion-common ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-mysql ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-xml ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-xmlrcp ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-curl ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-gd ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-cli ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-dev ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-mbstring ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-intl ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-zip ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-gmp ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-bcmath ${GREEN}✔${NC} /r/n"
echo -e "php$phpversion-gettext ${GREEN}✔${NC} /r/n"
echo -e "libapache2-mod-php$phpversion ${GREEN}✔${NC} /r/n"

echo "###############"
echo "# mysql - 4/5 #";
echo "###############"

echo -e "/r/n/r/n"

sudo apt install mysql-server -y
echo -e "mysql-server is now installed ${GREEN}✔${NC} /r/n"
sudo mysql_secure_installation

echo -e "script mysql_secure_installation is executed ${GREEN}✔${NC} /r/n"

echo -e "${RED}/!\ DO NOT FORGET TO UPDATE MYSQL PASSWORD ROOT /!\${NC}"

echo "####################"
echo "# phpmyadmin - 6/5 #";
echo "####################"

echo -e "/r/n/r/n"

sudo apt install phpmyadmin -y
echo -e "phpmyadmin is configured now ${GREEN}✔${NC} /r/n"

echo "My job is done now."
