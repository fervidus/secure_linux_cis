# 2.1.5 Ensure time services are not enabled (Scored)
#
# Description:
# time is a network service that responds with the server's current date and time as a 32 bit integer.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.5 Ensure time services are not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_1_5
class secure_linux_cis::redhat7::cis_2_1_5 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'time-dgram':
      ensure => stopped,
      enable => false,
    }

    service { 'time-stream':
      ensure => stopped,
      enable => false,
    }
  }
}
