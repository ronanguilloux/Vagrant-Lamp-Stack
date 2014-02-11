stage { 'prepare': before => Stage['main'] }

if $virtual == 'virtualbox' and $fqdn == '' {
    $fqdn = 'localhost'
}

class {
    'ubuntu':  stage => prepare;
    'apache':  stage => main;
    'php-cli': stage => main;
    'php-dev': stage => main;
    'phpmyadmin': stage => main;
    'nodejs': stage => main;
    'shell':   stage => main;
}
