if [ "$(whoami)" != 'root' ]; then
	echo -e $"\nYou dont have permission to run this script please login as root with sudo -s or use sudo.\n"
		exit 1;
fi

echo "Updating your required package and dependencies..."
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt autoremove
sudo apt-get install -y software-properties-common zip unzip




echo "********** Installing Nginx Server **********"
sudo apt install nginx -y

echo "********** Nginx Server Setup Done **********"
echo "To verify your apache server goto your IP with browser."




echo "Adding PPA(Personal Package Archive) for PHP..."
sudo add-apt-repository -y ppa:ondrej/php


echo "Enter the PHP version you want to install..."
php_versions=( 5.6 7.0 7.1 7.2 7.3 7.4 8.0 8.1 )

select php_version in "${php_versions[@]}"; do
    echo "You have chosen $php_version"
    break
done



echo "Installing PHP ${php_version}..."
sudo apt-get install -y php${php_version}-fpm php${php_version}-common php${php_version}-dom php${php_version}-intl php${php_version}-mysql php${php_version}-xml php${php_version}-xmlrpc php${php_version}-curl php${php_version}-gd php${php_version}-imagick php${php_version}-cli php${php_version}-dev php${php_version}-imap php${php_version}-mbstring php${php_version}-soap php${php_version}-zip php${php_version}-bcmath

echo "Installed PHP Version: $(php -v)"


echo "Installing Composer..."
sudo apt-get install curl -y
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer

echo "********** PHP and Composer Setup Done **********"



echo "********** MySQL Server & PHPMYADMIN Installation **********"
sudo apt install mysql-server -y
sudo mysql_secure_installation <<EOF

y
y
97VTYg5w2L9vJazd
97VTYg5w2L9vJazd
n
n
n
y
EOF

sudo wget -c https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-english.tar.gz
sudo tar xzvf phpMyAdmin-5.1.1-english.tar.gz
sudo mv phpMyAdmin-5.1.1-english /usr/share/phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html


