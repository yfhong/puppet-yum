# == Class yum::config
#
# This class is called from yum for service config.
#
class yum::config {
  file { "${::yum::params::confdir}":
    ensure  => 'directory',
    purge   => true,
    recurse => true,
  }

  $::yum::params::default_repos.each |$repo| {
    file { "${::yum::params::confdir}/${repo}":
      ensure => present,
      owner  => 'root',
      group  => $::yum::params::root_group,
      content => template("yum/${repo}.repo.erb"),
    }
  }
}
