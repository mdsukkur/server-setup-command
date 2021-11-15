#!/usr/bin/env bash

if [ "$(whoami)" != 'root' ]; then
	echo -e $"\nYou dont have permission to run this script please login as root with sudo -s or use sudo.\n"
		exit 1;
fi

echo "Updating your required package and dependencies..."
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt autoremove

sudo apt-get install -y software-properties-common zip unzip



echo "Installing Apache2 Server"
sudo apt-get install apache2

echo "********** Apache2 Server Setup Done **********"
echo "To verify your apache server goto your IP with browser."




echo "nodejs Installing..."
sudo apt install nodejs -y
echo "nodejs Install Completed"
echo "$(node -v)"
echo "npm Installing..."
sudo apt install npm
echo "$(npm -v)"




echo "Installing mysql Server..."
sudo apt install mysql-server -y
mysql --version

echo "Installing PHPMyAdmin..."
sudo apt install phpmyadmin
echo "********** MySQL and PHPMyAdmin Setup Done **********"



echo "Adding ppa(Personal Package Archive) for php..."
sudo add-apt-repository -y ppa:ondrej/php

echo "Enter the PHP version you want to install..."
php_versions=( 5.6 7.0 7.1 7.2 7.3 7.4 8.0 8.1 )

select php_version in "${php_versions[@]}"; do
    echo "You have chosen $php_version"
    break
done

echo "Installing PHP ${php_version}..."
sudo apt-get install -y php${php_version} php${php_version}-fpm php${php_version}-cli php${php_version}-gd
sudo apt-get install -y php${php_version}-common php${php_version}-curl php${php_version}-mbstring
sudo apt-get install -y php${php_version}-zip php${php_version}-xml php${php_version}-imap
sudo apt-get install -y php${php_version}-mysql php${php_version}-dev php${php_version}-intl php-pear
echo "$(php -v)"

echo "Installing Composer..."
sudo apt-get install curl
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer

echo "********** PHP and Composer Setup Done **********"
