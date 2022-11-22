# @api private
#
# @summary Ensure rsh server is not enabled 
#
class secure_linux_cis::rules::ensure_rsh_server_is_not_enabled {
  $rsh_services = [
    'rsh.socket',
    'rlogin.socket',
    'rexec.socket',
  ]
  service { $rsh_services:
    ensure => stopped,
    enable => false,
  }
}
