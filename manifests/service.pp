# == Class yum::service
#
# This class is meant to be called from yum.
# It ensure the service is running.
#
class yum::service {

  service { $::yum::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
