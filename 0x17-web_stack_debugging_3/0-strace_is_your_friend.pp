# 0. Strace is your friend

exec { 'fix_spelling_mistake':
  command => '/bin/sed -ibck "s/phpp/php/" wp-settings.php',
  cwd     => '/var/www/html/',
}
