# 3.5.3 Ensure RDS is disabled (Not Scored)
#
# Description:
# The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to
# provide low-latency, high-bandwidth communications between cluster nodes. It was
# developed by the Oracle Corporation.
#
# Rationale:
# If the protocol is not being used, it is recommended that kernel module not be loaded,
# disabling the service to reduce the potential attack surface.
#
# @summary 3.5.3 Ensure RDS is disabled (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_5_3
class secure_linux_cis::redhat7::cis_3_5_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    kmod::install { 'rds':
      command => '/bin/true',
    }
  }
}
