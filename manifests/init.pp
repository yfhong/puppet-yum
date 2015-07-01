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
  $plugin_package_name   = $::yum::params::plugin_package_name,
  $plugin_package_ensure = $::yum::params::plugin_package_ensure,
  $base_repo_mirror      = $::yum::params::base_repo_mirror,
  $epel_repo_mirror      = $::yum::params::epel_repo_mirror,
  $mysql_os_version      = $::operatingsystemmajrelease,
  $elasticsearch_version = '1.6',
  $logstash_version      = '1.5',
) inherits ::yum::params {

  # validate parameters here

  class { '::yum::install': } ->
  class { '::yum::config': } ->
  Class['::yum']
}
