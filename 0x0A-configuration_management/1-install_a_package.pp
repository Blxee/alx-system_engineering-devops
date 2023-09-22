# 1. Install a package

package { 'flask':
  ensure   => 'installed',
  provider => 'pip3',
}
