# @api private
#
# @summary Ensure systemd-timesyncd is enabled and running 
#
class secure_linux_cis::rules::ensure_systemd_timesyncd_is_enabled_and_running {
  if $secure_linux_cis::time_sync == 'systemd-timesyncd' {
    service { 'systemd-timesyncd':
      ensure => running,
      enable => true,
    }
  }
}
