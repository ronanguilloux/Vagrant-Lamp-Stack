#! /bin/bash
#
# bootstrap.sh for vagrant boxes, LAMP & vim oriented
# Copyright (C) 2013 Ronan Guilloux <ronan.guillou@gmail.com>
#
# Distributed under terms of the MIT license.

# Update apt sources
sudo apt-get update

# French keyboard
sudo locale-gen fr_FR.UTF-8
sudo loadkeys fr

# Basic Shell enhancements
sudo apt-get install zsh curl ngrep tree htop fortunes fortunes-fr vrms linuxlogo sysstat di discus pydf hardinfo lynx ack-grep pandoc most exuberant-ctags linux-headers-generic build-essential manpages-fr manpages-fr-extra manpages-dev cowsay cplay

# LAMP, the bases
sudo apt-get install apache2 apache2-mpm-prefork libapache2-mod-php5 apache2-utils php5 php5-dev phpmyadmin mysql-server imagemagick

# LAMP, extensions
sudo apt-get install php-apc php5-xdebug php5-mysql php5-sqlite php5-cli php5-curl php-pear php5-gd php5-imagick php5-imap php5-xsl php5-common php5-mcrypt php5-memcache php5-ps php5-pspell php5-recode php5-snmp php5-tidy php5-intl php-geshi

# Other CLI-related tools
sudo apt-get install tidy markdown git git-core git-doc git-svn git-email tig

# vagrant user becomes an Apacher
sudo adduser $LOGNAME www-data

# PHP-related tools
sudo pear config-set auto_discover 1
sudo pear install pear.phpqatools.org/phpqatools
if [ ! -d ~/bin ]
    then
        mkdir ~/bin
        cd ~/bin
        curl -s http://getcomposer.org/installer | php
        mv composer.phar composer
        chmod +x composer
        curl http://pear2.php.net/pyrus.phar -O
        mv pyrus.phar pyrus
        chmod +x pyrus
        curl http://cs.sensiolabs.org/get/php-cs-fixer.phar -O
        mv php-cs-fixer.phar php-cs-fixer
        chmod +x php-cs-fixer
fi

# Symfony2 standards
if [ ! -d /usr/share/php/PHP/CodeSniffer/Standards/Symfony2 ]
    then
        cd /usr/share/php/PHP/CodeSniffer/Standards/
        sudo git clone git://github.com/opensky/Symfony2-coding-standard.git Symfony2
        sudo phpcs --config-set default_standard Symfony2
fi

# Apache2 mods
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod deflate
sudo a2enmod expires
sudo a2enmod setenvif
sudo service apache2 restart

# NodeJs
sudo apt-get install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

# personal conf
if [ ! -d ~/Bin ]
    then
        cd ~/
        git clone https://github.com/ronanguilloux/Bin.git
fi

if [ ! -d ~/dotfiles ]
    then
        cd ~/
        git clone https://github.com/ronanguilloux/dotfiles.git
        . ./dotfiles/install.sh
        mv .bashrc .bashrc-dist && ln -s dotfiles/.bashrc .bashrc
fi

# Set enhanced ZSH as default
if [ ! -d ~/.oh-my-zsh ]
    then
        curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi
chsh -s /bin/zsh
echo "TODO : Configure php.ini (both CLI & Apache2)"
echo "TODO : Add  TZ=\"Europe/Paris\" to /etc/environment"
echo "TODO : Add a default ServerName as localhost to Apache2"
echo "TODO : Add /Apps/sites-enabled/ to /etc/apache2/apache2.conf file"
