# 3.2.6 Ensure bogus ICMP responses are ignored (Scored)
#
# Description:
# Setting icmp_ignore_bogus_error_responses to 1 prevents the kernel from logging bogus responses (RFC-1122 non-compliant)
# from broadcast reframes, keeping file systems from filling up with useless log messages.
#
# Rationale:
# Some routers (and some attackers) will send responses that violate RFC-1122 and attempt to fill up a log file system
# with many useless error messages.
#
# @summary 3.2.6 Ensure bogus ICMP responses are ignored (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_2_6
class secure_linux_cis::redhat7::cis_3_2_6 (
  Boolean $enforced = true,
) {

  if $enforced {
    sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
      value => 1,
    }
  }
}
