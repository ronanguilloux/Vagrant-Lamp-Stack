# -*- mode: ruby -*-
# vi: set ft=ruby :

class phpmyadmin::install {
    package { 'phpmyadmin':
        ensure => installed
    }
}

class phpmyadmin {
    include phpmyadmin::install
}
