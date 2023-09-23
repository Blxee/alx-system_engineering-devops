# 4. Client configuration file (w/ Puppet)

file_line { 'Declare identity file':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '\tIdentifyFile ~/.ssh/school',
}

file_line { 'Turn off passwd auth':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '\tPasswordAuthentication no',
}
