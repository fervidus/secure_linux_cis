# @api private
#  Ensure discard services are not enabled (Scored)
#
# Description:
# discard is a network service that simply discards all data it receives.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary  Ensure discard services are not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_discard_services_are_not_enabled
class secure_linux_cis::rules::ensure_discard_services_are_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'discard-dgram':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
    service { 'discard-stream':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
