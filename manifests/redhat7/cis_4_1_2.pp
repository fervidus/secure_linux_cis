# 4.1.2 Ensure auditd service is enabled (Scored)
#
# Description:
# Turn on the auditd daemon to record system events.
#
# Rationale:
# The capturing of system events provides system administrators with information to allow
# them to determine if unauthorized access to their system is occurring.
#
# @summary 4.1.2 Ensure auditd service is enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_2
class secure_linux_cis::redhat7::cis_4_1_2 (
  Boolean $enforced = true,
) {

  case $facts['os']['family'] {
    'RedHat': {
      $package = 'audit'
    }
    'Debian': {
      $package = 'auditd'
    }
    default: {
    }
  }

  if $enforced {

    # Also ensuring the package is installed before the service
    package { $package:
      ensure => installed,
      before => Service['auditd'],
    }

    service { 'auditd':
      ensure => running,
      enable => true,
    }

  }
}
