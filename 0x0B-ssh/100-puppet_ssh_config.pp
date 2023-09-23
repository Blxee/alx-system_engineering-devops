# 4. Client configuration file (w/ Puppet)

file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentifyFile ~/.ssh/school',
  match => '^#?IdentifyFile',
}

file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^#?PasswordAuthentication',
}
