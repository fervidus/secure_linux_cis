# @api private
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
class secure_linux_cis::rules::ensure_auditd_service_is_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    # Also ensuring the package is installed before the service
    package { $::secure_linux_cis::auditd_package:
      ensure   => installed,
      schedule => 'harden_schedule',
      before   => Service['auditd'],
    }
    service { 'auditd':
      ensure   => running,
      schedule => 'harden_schedule',
      enable   => true,
    }
  }
}
