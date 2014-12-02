# Sample class to install and manage an openssh server

class openssh {
  
  package {'openssh-server':
    ensure => '5.3p1-94',
  }

  file {'/etc/ssh/sshd_config':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/openssh/sshd_config',
    #content => template("openssh/sshd_config.erb")
    require => Package['openssh-server']
  }

  service {'sshd':
    ensure    => running,
    enable    => true,
    subscribe => File['sshd_config']
  }

}
