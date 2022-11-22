# @api private
#
# @summary Ensure packet redirect sending is disabled 
#
class secure_linux_cis::rules::ensure_packet_redirect_sending_is_disabled {
  sysctl { 'net.ipv4.conf.all.send_redirects':
    value    => 0,
  }
  sysctl { 'net.ipv4.conf.default.send_redirects':
    value    => 0,
  }
}
