# @api private
#  Ensure time services are not enabled (Scored)
#
# Description:
# time is a network service that responds with the server's current date and time as a 32 bit integer.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary  Ensure time services are not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_time_services_are_not_enabled
class secure_linux_cis::rules::ensure_time_services_are_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'time-dgram':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
    service { 'time-stream':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
