# @api private
#  Ensure RDS is disabled (Not Scored)
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
# @summary  Ensure RDS is disabled (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_rds_is_disabled
class secure_linux_cis::rules::ensure_rds_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    kmod::install { 'rds':
      command => '/bin/true',
    }
  }
}
