# 5. Install Nginx web server (w/ Puppet)
class { 'nginx':
  manage_repo => true,
  service_enable => true,
  service_ensure => 'running',
}

nginx::resource::vhost { 'default':
  www_root    => '/var/www/html',
  listen_ip   => '0.0.0.0',
  listen_port => '80',
}

nginx::resource::location { 'default':
  location    => '/',
  vhost       => 'default',
  ensure      => present,
  content     => 'Hello World!',
}

nginx::resource::location { 'redirect':
  location       => '/redirect_me',
  vhost          => 'default',
  ensure         => present,
  rewrite_rules  => ['^/redirect_me$ https://example.com permanent;'],
}
