# == Class yum::params
#
# This class is meant to be called from yum.
# It sets variables according to platform.
#
class yum::params {

  $confdir = '/etc/yum.repos.d'

  $plugin_package_name = [
                          'yum-plugin-priorities',
                          'yum-plugin-fastestmirror',
                          ]
  $plugin_package_ensure = 'present'

  ## repo variables.
  $repo_os_version = "${::operatingsystemmajrelease}"
  $epel_os_version = "${::operatingsystemmajrelease}"
  $puppetlabs_os_version = "${::operatingsystemmajrelease}"

  $default_repos = $::operatingsystemmajrelease ? {
    '7'     => ['base', 'epel', 'puppetlabs'],
    '6'     => ['base', 'epel', 'puppetlabs', 'collectd'],
    default => [],
  }

  $base_repo_mirror = 'mirrors.163.com'
  $epel_repo_mirror = 'mirrors.aliyun.com'

  ## global parameters
  $root_group = $::operatingsystem ? {
    /(FreeBSD|Solaris)/ => 'wheel',
    default             => 'root',
  }

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Amazon': {
      case $::operatingsystemmajrelease {
        '6', '7': {
        }
        default: {
          fail("${::operatingsystem} ${::operatingsystemmajrelease} not supported")
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
