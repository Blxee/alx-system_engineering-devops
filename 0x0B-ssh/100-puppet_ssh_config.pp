# 4. Client configuration file (w/ Puppet)

file_line { 'Declare identity file':
  path               => '/etc/ssh/ssh_config',
  line               => '\tIdentifyFile ~/.ssh/school',
  match              => '^#?\s*IdentifyFile .+$',
  append_on_no_match => true,
}

file_line { 'Turn off passwd auth':
  path               => '/etc/ssh/ssh_config',
  line               => '\tPasswordAuthentication no',
  match              => '^#?\s*PasswordAuthentication (yes|no)$',
  append_on_no_match => true,
}
