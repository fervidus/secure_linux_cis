# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_systemd_timesyncd_is_enabled_and_running {
  if $secure_linux_cis::time_sync == 'systemd-timesyncd' {
    service { 'systemd-timesyncd':
      ensure => running,
      enable => true,
    }
  }
}
