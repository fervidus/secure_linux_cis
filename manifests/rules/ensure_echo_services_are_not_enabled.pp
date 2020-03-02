# @api private
#  Ensure echo services are not enabled (Scored)
#
# Description:
# echo is a network service that responds to clients with the data sent to it by the client.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary  Ensure echo services are not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_echo_services_are_not_enabled
class secure_linux_cis::rules::ensure_echo_services_are_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'echo-dgram':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
    service { 'echo-stream':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
