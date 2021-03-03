#!/bin/bash

# Install Certbot for free HTTPS

read -p "WARNING ! To avoid errors, this script must be exectured after your VHOST creation. Continue ? (Y/n) " certbot_choice

case "$certbot_choice" in
	n|N )
		echo "Certbot install aborted";;
	* )
		sudo apt update
		sudo snap install core
		sudo snap refresh core
		sudo apt-get remove certbot
		sudo snap install --classic certbot
		sudo ln -s /snap/bin/certbot /usr/bin/certbot
		sudo certbot --apache
		echo "Certbot is installed & configured";;
esac
