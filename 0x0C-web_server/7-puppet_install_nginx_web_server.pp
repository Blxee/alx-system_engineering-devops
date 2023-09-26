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

file_line { '/etc/nginx/sites-available/default':
  line     => '\tlocation / {',
  match    => '\tlocation / {',
  replace  => '\tlocation / {\n\t\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  require  => Service['nginx'],
  notify   => Service['nginx'],
}
