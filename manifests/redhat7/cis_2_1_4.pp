# 2.1.4 Ensure echo services are not enabled (Scored)
#
# Description:
# echo is a network service that responds to clients with the data sent to it by the client.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.4 Ensure echo services are not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_1_4
class secure_linux_cis::redhat7::cis_2_1_4 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'echo-dgram':
      ensure => stopped,
      enable => false,
    }

    service { 'echo-stream':
      ensure => stopped,
      enable => false,
    }
  }
}
