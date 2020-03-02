# @api private
#  Ensure chargen services are not enabled (Scored)
#
# Description:
# chargenis a network service that responds with 0 to 512 ASCII characters for each connection it receives.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary  Ensure chargen services are not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_chargen_services_are_not_enabled
class secure_linux_cis::rules::ensure_chargen_services_are_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'chargen-dgram':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
    service { 'chargen-stream':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
