class designate::ls3-fix {

  file { "/etc/apt/apt.conf.d/11overwrite":
    ensure => present,
    content => "Dpkg::Options {\n   \"--force-overwrite\";\n }",
  } 

  exec { 'apt-get-fix':
    command => "/usr/bin/apt-get -f -y install",
    unless  => "/usr/bin/apt-get check",
  }
}
