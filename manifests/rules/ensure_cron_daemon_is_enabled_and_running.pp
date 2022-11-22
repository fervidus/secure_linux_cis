# @api private
#
# @summary Ensure cron daemon is enabled and running 
#
class secure_linux_cis::rules::ensure_cron_daemon_is_enabled_and_running {
  service { $secure_linux_cis::cron_service:
    ensure => running,
    enable => true,
  }
}
