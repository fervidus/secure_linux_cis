# @api private
#
# @summary Ensure broadcast ICMP requests are ignored 
#
class secure_linux_cis::rules::ensure_broadcast_icmp_requests_are_ignored {
  sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
    value    => 1,
  }
}
