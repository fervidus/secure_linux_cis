# @api private
#  Ensure DCCP is disabled (Not Scored)
#
# Description:
# The Datagram Congestion Control Protocol (DCCP) is a transport layer protocol that
# supports streaming media and telephony. DCCP provides a way to gain access to
# congestion control, without having to do it at the application layer, but does not provide insequence
# delivery.
#
# Rationale:
# If the protocol is not required, it is recommended that the drivers not be installed to reduce
# the potential attack surface.
#
# @summary  Ensure DCCP is disabled (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_dccp_is_disabled
class secure_linux_cis::rules::ensure_dccp_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    kmod::install { 'dccp':
      command => '/bin/true',
    }
  }
}
