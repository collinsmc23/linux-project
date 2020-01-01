#!/bin/bash

# Goal: Script which automatically downloads the LAMP STACK

# Test to see if user is running with root privileges.
if [[ "${UID}" -ne 0 ]]
then
 echo 'Must execute with sudo or root' >&2
 exit 1
fi

# Ensure system is up to date
sudo apt-get update -y 

# Install Apache
sudo apt-get install apache2 apache2-doc apache2-npm-prefork apache2-utils libexpat1 ssl-cert -y

# Install PHP
sudo apt-get install php libapache2-mod-php php-mysql -y

# Install MySQL
sudo apt-get install mysql-server -y

# Install PhpMyAdmin (for database access)
sudo apt-get install phpMyAdmin -y

# Configure phpMyAdmin
echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf

# Set permissions using chown
sudo chown -R www-data:www-data /var/www

# Restart apache
sudo service apache2 restart 

# Check exit code
if [[ "${?}" -n0 0 ]]
then 
 echo "Failed to install the LAMP Stack" >&2
 exit 1
fi

exit 0


