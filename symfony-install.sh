#!/bin/bash

# REQUIRED: Ubuntu 18.04

echo "SYMFONY BINARY"

wget https://get.symfony.com/cli/installer -O - | bash
mv /home/{$USER}/.symfony/bin/symfony /usr/local/bin/symfony

echo "SYMFONY OK..."