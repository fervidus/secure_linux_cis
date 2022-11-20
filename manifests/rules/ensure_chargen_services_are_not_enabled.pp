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
class secure_linux_cis::rules::ensure_chargen_services_are_not_enabled {
  service { 'chargen-dgram':
    ensure => stopped,
    enable => false,
  }
  service { 'chargen-stream':
    ensure => stopped,
    enable => false,
  }
}
