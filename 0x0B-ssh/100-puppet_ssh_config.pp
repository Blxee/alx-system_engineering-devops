# 4. Client configuration file (w/ Puppet)

file { 'Create ssh_config':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
}

file_line { 'Declare identity file':
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentifyFile ~/.ssh/school',
  match   => '^IdentifyFile.*',
  replace => true,
}

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => '^PasswordAuthentication.*',
  replace => true,
}
