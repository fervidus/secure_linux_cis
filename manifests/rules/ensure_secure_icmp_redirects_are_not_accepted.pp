# @api private
#
# @summary Ensure secure ICMP redirects are not accepted 
#
class secure_linux_cis::rules::ensure_secure_icmp_redirects_are_not_accepted {
  sysctl { 'net.ipv4.conf.all.secure_redirects':
    value    => 0,
  }
  sysctl { 'net.ipv4.conf.default.secure_redirects':
    value    => 0,
  }
}
