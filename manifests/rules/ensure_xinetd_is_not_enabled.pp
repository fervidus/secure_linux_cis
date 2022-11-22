# @api private
#
# @summary Ensure xinetd is not enabled 
#
class secure_linux_cis::rules::ensure_xinetd_is_not_enabled {
  service { 'xinetd':
    ensure => stopped,
    enable => false,
  }
}
