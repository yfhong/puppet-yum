# == Class: yum
#
# Full description of class yum here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class yum (
  $package_name = $::yum::params::package_name,
  $service_name = $::yum::params::service_name,
) inherits ::yum::params {

  # validate parameters here

  class { '::yum::install': } ->
  class { '::yum::config': } ~>
  class { '::yum::service': } ->
  Class['::yum']
}
