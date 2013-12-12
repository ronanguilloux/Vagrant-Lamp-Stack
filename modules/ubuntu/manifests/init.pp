class ubuntu {
    exec { 'install-sources':
        path => '/usr/bin',
        command => 'sudo cp /vagrant/sources.list /etc/apt/'
    }
    exec { 'apt-get-update':
        path => '/usr/bin',
        command => 'sudo apt-get update --fix-missing'
    }
}
