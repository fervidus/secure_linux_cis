# @api private
#
# @summary Ensure tftp server is not enabled 
#
class secure_linux_cis::rules::ensure_tftp_server_is_not_enabled {
  service { 'tftp.socket':
    ensure => stopped,
    enable => false,
  }
}
