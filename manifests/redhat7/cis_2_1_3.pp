# 2.1.3 Ensure discard services are not enabled (Scored)
#
# Description:
# discard is a network service that simply discards all data it receives.
# This service is intended for debugging and testing purposes. It is recommended that this service be disabled.
#
# Rationale:
# Disabling this service will reduce the remote attack surface of the system.
#
# @summary 2.1.3 Ensure discard services are not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_1_3
class secure_linux_cis::redhat7::cis_2_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'discard-dgram':
      ensure => stopped,
      enable => false,
    }

    service { 'discard-stream':
      ensure => stopped,
      enable => false,
    }
  }
}
