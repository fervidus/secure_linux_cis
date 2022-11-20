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
class secure_linux_cis::rules::ensure_time_services_are_not_enabled {
  service { 'time-dgram':
    ensure => stopped,
    enable => false,
  }
  service { 'time-stream':
    ensure => stopped,
    enable => false,
  }
}
