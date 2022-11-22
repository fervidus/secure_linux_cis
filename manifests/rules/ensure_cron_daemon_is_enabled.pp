# @api private
#
# @summary Ensure cron daemon is enabled 
#
class secure_linux_cis::rules::ensure_cron_daemon_is_enabled {
  service { $secure_linux_cis::cron_service:
    ensure => running,
    enable => true,
  }
}
