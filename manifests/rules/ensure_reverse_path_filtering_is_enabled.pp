# @api private
#  Ensure Reverse Path Filtering is enabled (Scored)
#
# Description:
# Setting net.ipv4.conf.all.rp_filter and net.ipv4.conf.default.rp_filter to 1 forces the Linux kernel to utilize
# reverse path filtering on a received packet to determine if the packet was valid. Essentially, with reverse path
# filtering, if the return packet does not go out the same interface that the corresponding source packet came from,
# the packet is dropped (and logged if log_martians is set).
#
# Rationale:
# Setting these flags is a good way to deter attackers from sending your system bogus packets that cannot be responded
# to. One instance where this feature breaks down is if asymmetrical routing is employed. This would occur when using
# dynamic routing protocols (bgp, ospf, etc) on your system. If you are using asymmetrical routing on your system,
# you will not be able to enable this feature without breaking the routing.
#
# @summary  Ensure Reverse Path Filtering is enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_reverse_path_filtering_is_enabled
class secure_linux_cis::rules::ensure_reverse_path_filtering_is_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'net.ipv4.conf.all.rp_filter':
      value    => 1,
      schedule => 'harden_schedule',
    }
    sysctl { 'net.ipv4.conf.default.rp_filter':
      value    => 1,
      schedule => 'harden_schedule',
    }
  }
}
