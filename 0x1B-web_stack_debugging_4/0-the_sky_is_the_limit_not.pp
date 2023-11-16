# 0. Sky is the limit, let's bring that limit higher

exec { 'unlimit':
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure  => 'running',
  require => Exec['unlimit'],
}
