# -*- mode: ruby -*-
# vi: set ft=ruby :

class shell {
    $packages = [
        'acl',
        'curl',
        'git',
        'tig',
        'vim',
        'tidy',
        'markdown',
        'zsh',
        'ngrep',
        'tree',
        'htop',
        'fortunes',
        'fortunes-fr',
        'sysstat',
        'di',
        'discus',
        'pydf',
        'hardinfo',
        'lynx',
        'ack-grep',
        'pandoc',
        'most',
        'exuberant-ctags',
        'linux-headers-generic',
        'build-essential',
        'manpages-fr',
        'manpages-fr-extra',
        'manpages-dev',
        'cowsay',
        'linuxlogo'
    ]
    package { $packages:
        ensure => installed
    }
}
