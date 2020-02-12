# @api private
#  Ensure SCTP is disabled (Not Scored)
#
# Description:
# The Stream Control Transmission Protocol (SCTP) is a transport layer protocol used to
# support message oriented communication, with several streams of messages in one
# connection. It serves a similar function as TCP and UDP, incorporating features of both. It is
# message-oriented like UDP, and ensures reliable in-sequence transport of messages with
# congestion control like TCP.
#
# Rationale:
# If the protocol is not being used, it is recommended that kernel module not be loaded,
# disabling the service to reduce the potential attack surface.
#
# @summary  Ensure SCTP is disabled (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_sctp_is_disabled
class secure_linux_cis::rules::ensure_sctp_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    kmod::install { 'sctp':
      command => '/bin/true',
    }
  }
}
