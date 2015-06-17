include nginx, php

exec { 'apt-get update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

package { ['vim', 'nano', 'git']:
  ensure => present,
}

class { 'composer':
  auto_update => true,
}

class { '::mysql::server':
  root_password => 'root',
  remove_default_accounts => true
}

mysql::db { 'cms':
  user     => 'cms',
  password => 'cms',
  host     => '%',
  grant    => ['ALL'],
}

class { 'nodejs':
  version => 'stable',
  make_install => false,
}

package { [ 'grunt-cli', 'bower' ]:
  ensure => present,
  provider => 'npm',
  require  => Class['nodejs'],
}
