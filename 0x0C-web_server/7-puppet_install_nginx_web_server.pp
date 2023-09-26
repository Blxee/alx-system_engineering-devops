# 5. Install Nginx web server (w/ Puppet)
package { 'nginx':
  ensure => 'installed',
}

service { 'nginx':
  ensure => 'running',
  enable => true,
}

file { '/etc/nginx/sites-available/default':
  notify => Service['nginx'],
}

file { '/var/www/html/index.html':
  ensure  => 'present',
  content => 'Hello World!',
}
