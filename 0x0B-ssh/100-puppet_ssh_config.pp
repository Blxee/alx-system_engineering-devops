# 4. Client configuration file (w/ Puppet)

file_line { '/etc/ssh/ssh_config':
  line  => 'IdentifyFile ~/.ssh/school',
  match => 'IdentifyFile',
}

file_line { '/etc/ssh/ssh_config':
  line  => 'PasswordAuthentication no',
  match => 'PasswordAuthentication',
}
