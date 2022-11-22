# @api private
#
# @summary Ensure suspicious packets are logged 
#
class secure_linux_cis::rules::ensure_suspicious_packets_are_logged {
  sysctl { 'net.ipv4.conf.all.log_martians':
    value    => 1,
  }
  sysctl { 'net.ipv4.conf.default.log_martians':
    value    => 1,
  }
}
