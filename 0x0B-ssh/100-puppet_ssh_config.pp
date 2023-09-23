# 4. Client configuration file (w/ Puppet)

file { '/etc/ssh/ssh_config':
  content => 'Host alx-server\n\tHostName 100.25.152.12\n\tUser ubuntu\n\tIdentifyFile ~/.ssh/school',
}
