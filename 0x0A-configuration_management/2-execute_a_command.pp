# 2. Execute a command

exec { 'pkill -f killmenow':
  refreshonly => true,
}
