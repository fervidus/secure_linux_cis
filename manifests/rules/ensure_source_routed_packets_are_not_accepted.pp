# @api private
#
# @summary Ensure source routed packets are not accepted 
#
class secure_linux_cis::rules::ensure_source_routed_packets_are_not_accepted {
  if $facts['os']['family'] == 'Debian' or ($facts['os']['family'] == 'RedHat' and $facts['os']['release']['major'] == '8') {
    if $secure_linux_cis::ipv6_enabled {
      $do_ipv6 = true
    } else {
      $do_ipv6 = false
    }
  } else {
    $do_ipv6 = false
  }
  sysctl { 'net.ipv4.conf.all.accept_source_route':
    value    => 0,
  }
  sysctl { 'net.ipv4.conf.default.accept_source_route':
    value    => 0,
  }
  if $do_ipv6 {
    sysctl { 'net.ipv6.conf.all.accept_source_route':
      value    => 0,
    }
    sysctl { 'net.ipv6.conf.default.accept_source_route':
      value    => 0,
    }
  }
}
