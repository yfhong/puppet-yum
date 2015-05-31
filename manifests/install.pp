# == Class yum::install
#
# This class is called from yum for install.
#
class yum::install {

  package { $::yum::package_name:
    ensure => present,
  }
}
