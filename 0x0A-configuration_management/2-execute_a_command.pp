# 2. Execute a command

exec { 'pkill killmenow':
  onlyif      => 'pgrep killmenow',
  refreshonly => true,
}
