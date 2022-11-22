# @api private
#
# @summary Ensure ICMP redirects are not accepted 
#
class secure_linux_cis::rules::ensure_icmp_redirects_are_not_accepted {
  sysctl { 'net.ipv4.conf.all.accept_redirects':
    value    => 0,
  }
  sysctl { 'net.ipv4.conf.default.accept_redirects':
    value    => 0,
  }

  if $secure_linux_cis::ipv6_enabled {
    sysctl { 'net.ipv6.conf.all.accept_redirects':
      value    => 0,
    }
    sysctl { 'net.ipv6.conf.default.accept_redirects':
      value    => 0,
    }
  }
}
