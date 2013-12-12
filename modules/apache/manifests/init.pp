# -*- mode: ruby -*-
# vi: set ft=ruby :

class apache::install {
    package { ['apache2-mpm-prefork', 'apache2-utils']:
        ensure => installed,
    }
}

class apache::configure {
    define apache::loadmodule () {
        exec { "/usr/sbin/a2enmod $name" :
            unless => "/bin/readlink -e /etc/apache2/mods-enabled/${name}.load",
            notify => Service[apache2]
        }
    }

    apache::loadmodule{"rewrite": }
    apache::loadmodule{"headers": }
    apache::loadmodule{"deflate": }
    apache::loadmodule{"expires": }
    apache::loadmodule{"setenvif": }
}

class apache::run {
    service { apache2:
        enable => true,
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        require => Class['apache::install', 'apache::configure'],
    }
}

class apache {
    include apache::install
    include apache::configure
    include apache::run
}

