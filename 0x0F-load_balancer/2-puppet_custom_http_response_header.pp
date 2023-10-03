# 2. Add a custom HTTP header with Puppet

exec { 'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update'],
}

file_line { 'add header':
  path    => '/etc/nginx/sites-available/default',
  line    => 'add_header X-Served-By \$hostname;',
  match   => '^\s*server_name.*;$',
  require => Package['nginx'],
}

service { 'nginx':
  ensure  => 'running',
  require => Package['nginx'],
}
