# 2. Execute a command

exec { 'kill him now':
  command     => 'pkill -f killmenow',
  refreshonly => true,
}
