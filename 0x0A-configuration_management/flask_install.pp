class flask_install {
  # Ensure that pip3 is installed
  package { 'python3-pip':
    ensure => installed,
  }

  # Install Flask version 2.1.0 using pip3
  package { 'Flask==2.1.0':
    ensure   => present,
    provider => 'pip3',
    require  => Package['python3-pip'],
  }
}

# Apply the class to the node
include flask_install

