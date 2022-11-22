# @api private
#
# @summary Ensure bogus ICMP responses are ignored 
#
class secure_linux_cis::rules::ensure_bogus_icmp_responses_are_ignored {
  sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
    value    => 1,
  }
}
