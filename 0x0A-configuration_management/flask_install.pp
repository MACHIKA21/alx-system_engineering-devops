class flask_install {
  # Ensure that pip3 is installed
  package { 'python3-pip':
    ensure => installed,
  }

  # Ensure that Flask version 2.1.0 is installed using pip3
  exec { 'install_flask':
    command => '/usr/bin/pip3 install Flask==2.1.0',
    unless  => '/usr/bin/pip3 show Flask | grep -q "Version: 2.1.0"',
    require => Package['python3-pip'],
    path    => ['/bin', '/usr/bin'],
  }
}

# Apply the class to the node
include flask_install

