# == Class yum::params
#
# This class is meant to be called from yum.
# It sets variables according to platform.
#
class yum::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'yum'
      $service_name = 'yum'
    }
    'RedHat', 'Amazon': {
      $package_name = 'yum'
      $service_name = 'yum'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
