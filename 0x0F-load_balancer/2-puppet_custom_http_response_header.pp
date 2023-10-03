# 2. Add a custom HTTP header with Puppet

exec { 'update':
  command => 'sudo apt-get -y update',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update'],
}

file_line { 'add header':
  path    => '/etc/nginx/sites-available/default',
  line    => 'add_header X-Served-By \$hostname;',
  after   => 'server_name .*;',
  match   => '^.*server_name .*;$',
  require => Package['nginx'],
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
