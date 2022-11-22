# @api private
#
# @summary Ensure permissions on /etc/cron.hourly are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_cron_hourly_are_configured {
  file { '/etc/cron.hourly':
    ensure => directory,
    # schedule => 'harden_schedule',
    group  => 'root',
    owner  => 'root',
    mode   => 'og-rwx',
  }
}
