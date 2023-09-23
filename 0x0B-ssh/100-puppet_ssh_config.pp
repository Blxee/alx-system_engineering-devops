# 4. Client configuration file (w/ Puppet)

file_line { 'set key to use':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentifyFile ~/.ssh/school',
  match => 'IdentifyFile',
}

file_line { 'turn off password':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => 'PasswordAuthentication',
}
