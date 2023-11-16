# 1. User limit

exec { 'unlimit':
  command => '/bin/sed "/[45]/d" /etc/security/limits.conf',
}
