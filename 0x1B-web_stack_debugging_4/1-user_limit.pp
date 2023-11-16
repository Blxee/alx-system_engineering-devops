# 1. User limit

exec { 'unlimit':
  command => '/bin/sed -i "/[45]/d" /etc/security/limits.conf',
}
