# @api private
#
# @summary Ensure TCP SYN Cookies is enabled 
#
class secure_linux_cis::rules::ensure_tcp_syn_cookies_is_enabled {
  sysctl { 'net.ipv4.tcp_syncookies':
    value    => 1,
  }
}
