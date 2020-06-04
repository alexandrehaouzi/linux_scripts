#! bin/bash

echo "UPDATE"

sudo apt-get update

echo "INSTALL DEPENDENCES"

sudo apt-get install software-properties-common

echo "ADD APT"

sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot

echo "UPDATE"

sudo apt-get update

echo "INSTALL CERTBOT"

sudo certbot --apache

echo "INSTALL CERTBOT OK"