# @api private
#
# @summary Ensure systemd-timesyncd is configured 
#
class secure_linux_cis::rules::ensure_systemd_timesyncd_is_configured {
  if $secure_linux_cis::time_sync == 'systemd-timesyncd' {
    file { '/etc/systemd/timesyncd.conf':
      ensure => file,
    }
  }
}
