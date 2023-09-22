# 2. Execute a command

exec { 'kill him now':
  command => 'pkill -f "killmenow"',
  path    => ['/bin', '/usr/bin', '/sbin'],
}
