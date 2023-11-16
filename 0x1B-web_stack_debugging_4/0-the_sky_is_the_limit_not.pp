# 0. Sky is the limit, let's bring that limit higher

exec { 'unlimit':
  command => '/bin/sed "s/15/4096/" /etc/default/nginx',
}

exec { 'nginx':
  ensure    => 'running',
  subscribe => Exec['ulimit'],
}
