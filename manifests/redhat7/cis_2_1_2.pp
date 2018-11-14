# 2.1.2 Ensure daytime services are not enabled (Scored)
#
# Description:
# daytime is a network service that responds with the server's current date and time.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.2 Ensure daytime services are not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_1_2
class secure_linux_cis::redhat7::cis_2_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'daytime-dgram':
      ensure => stopped,
      enable => false,
    }

    service { 'daytime-stream':
      ensure => stopped,
      enable => false,
    }
  }
}
