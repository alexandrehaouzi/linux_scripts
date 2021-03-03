#!/bin/bash

# By @lx
# REQUIRED: Ubuntu 20.04
# git configuration
# apache2 installation & configuration
# ssh installation
# php & modules installation
# composer installation
# mysql installation
# phpmyadmin installation
# yarn installation

echo "# GIT"

read -p "Configure git ? (Y/n)" choice_git

case "$choice_git" in
	n|N )
		echo "Skip git configuration";;
	* )
		read -p 'Git username : ' gitname
		git config --global user.name $gitname
		read -p 'Git user email : ' gitemail
		git config --global user.email $gitemail
		git config --global color.ui auto
		echo "Git color.ui is OK ✔"
		git config --global merge.conflictstyle diff3
		echo "Git merge.conflictstyle is OK ✔"
		echo "Git check ✔";;
esac

###############################

echo "# APACHE2"

read -p "Install & run Apache2 ? (Y/n)" choice_apache2

case "$choice_apache2" in
	n|N )
		echo "Skip Apache2 installation & configuration";;
	* )
		sudo apt install apache2 -y
		echo "Apache2 is installed ✔"
		sudo service apache2 restart
		echo "Apache2 check ✔";;
esac

###############################

echo "# SSH"

read -p "Install SSH module ? (Y/n)" choice_ssh

case "$choice_ssh" in
	n|N )
		echo "Skip ssh installion";;
	* )
		sudo apt install ssh
		echo -e "SSH check ✔"
esac

###############################

echo "# PHP"

read -p "Install PHP & modules ? (Y/n)" php_choice

case "$php_choice" in
	n|N )
		echo "Skip PHP & PHP modules installation";;
	* )
		sudo apt install software-properties-common
		sudo add-apt-repository ppa:ondrej/php -y
		echo "Add repository apt ➝ ppa:ondrej/php"
		sudo apt update
		read -p 'What version of php do you want to install ? (example : 7.4) : ' phpversion
		sudo apt install php$phpversion php$phpversion-{common,mysql,xml,xmlrpc,curl,gd,cli,dev,mbstring,intl,zip,gmp,bcmath} libapache2-mod-php$phpversion -y
		echo "PHP $phpversion check ✔"
esac

###############################

echo "# Composer"

read -p "Install composer ? (Y/n)" composer_choice

case "$composer_choice" in
	n|N )
		echo "Skip composer installation";;
	* )
		php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
		sudo php composer-setup.php --install-dir=/bin --filename=composer
		#php -r "unlink('composer-setup.php')"
		echo "Composer check ✔";;
esac

###############################

echo "#Symfony"

read -p "Install symfony ? (Y/n)" symfony_choice

case "$symfony_choice" in
	n|N )
		echo "Skip symfony";;
	* )
		wget https://get.symfony.com/cli/installer -O - | bash
		sudo mv /home/$USER/.symfony/bin/symfony /usr/local/bin/symfony
		echo "Symfony check ✔";;
esac

###############################

echo "# MySQL"

read -p "Install & configure MySQL ? (Y/n)" mysql_choice

case "$mysql_choice" in
	n/N )
		echo "Skip MySQL";;
	* )
		sudo apt install mysql-server -y
		sudo mysql_secure_installation
		echo "MySQL check ✔";;
esac

###############################

echo "# PHPMyadmin"

read -p "Install PHPMyadmin ? (Y/n)" phpmyadmin_choice

case "$phpmyadmin_choice" in
	n|N )
		echo "Skip phpmyadmin";;
	* )
		sudo apt install phpmyadmin -y
		echo "PHPMyadmin check ✔";;
esac

###############################

echo "# Yarn"

read -p "Install Yarn ? (Y/n)" yarn_choice

case "$yarn_choice" in
	n|N )
		echo "Skip Yarn";;
	* )
		curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
		echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
		export "NODE_OPTIONS=--max_old_space_size=4096"
		sudo apt update
		sudo apt install yarn -y
		echo "Yarn check ✔";;
esac
