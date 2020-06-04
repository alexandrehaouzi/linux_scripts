#!/bin/bash

# REQUIRED: Ubuntu 18.04
echo "COMPOSER INSTALL"

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php')"
php composer-setup.php --install-dir=/usr/bin

echo "COMPOSER OK..."
