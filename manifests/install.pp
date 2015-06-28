# == Class yum::install
#
# This class is called from yum for install.
#
class yum::install {

  # install yum plugins.
  package { $::yum::plugin_package_name:
    ensure => $::yum::plugin_package_ensure,
  }
}
