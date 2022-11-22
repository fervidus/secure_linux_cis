# @api private
#
# @summary Ensure ntp is enabled and running 
#
class secure_linux_cis::rules::ensure_ntp_is_enabled_and_running {
  service { 'ntp':
    ensure => running,
    enable => true,
  }
}
