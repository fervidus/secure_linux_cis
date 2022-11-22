# @api private
#
# @summary Ensure permissions on /etc/cron.daily are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_cron_daily_are_configured (
  Boolean $enforced = true,
) {
  if $enforced {
    file { '/etc/cron.daily':
      ensure => directory,
      # schedule => 'harden_schedule',
      group  => 'root',
      owner  => 'root',
      mode   => 'og-rwx',
    }
  }
}
