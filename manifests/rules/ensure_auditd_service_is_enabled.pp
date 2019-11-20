#  Ensure auditd service is enabled (Scored)
#
# Description:
# Turn on the auditd daemon to record system events.
#
# Rationale:
# The capturing of system events provides system administrators with information to allow
# them to determine if unauthorized access to their system is occurring.
#
# @summary  Ensure auditd service is enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_auditd_service_is_enabled

class secure_linux_cis::rules::ensure_auditd_service_is_enabled {

  case $facts['os']['family'] {
    'RedHat': {
      $package = 'audit'
    }
    'Debian': {
      $package = 'auditd'
    }
    default: {
      notify { "This auditd package check is not yet implemented for ${facts['os']['family']}": }
      $package = 'TODO auditd'
    }
  }

  # Also ensuring the package is installed before the service
  package { $package:
    ensure => installed,
    before => Service['auditd'],
  }

  service { 'auditd':
    ensure => running,
    enable => true,
  }

  # Make sure package is installed before configuration is adjusted
  Package[$package] -> File_line <| path == '/etc/audit/auditd.conf' |>

}
