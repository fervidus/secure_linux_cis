# @api private
#  Ensure bogus ICMP responses are ignored (Scored)
#
# Description:
# Setting icmp_ignore_bogus_error_responses to 1 prevents the kernel from logging bogus responses (RFC-1122 non-compliant)
# from broadcast reframes, keeping file systems from filling up with useless log messages.
#
# Rationale:
# Some routers (and some attackers) will send responses that violate RFC-1122 and attempt to fill up a log file system
# with many useless error messages.
#
# @summary  Ensure bogus ICMP responses are ignored (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_bogus_icmp_responses_are_ignored
class secure_linux_cis::rules::ensure_bogus_icmp_responses_are_ignored(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
      value    => 1,
      schedule => 'harden_schedule',
    }
  }
}
