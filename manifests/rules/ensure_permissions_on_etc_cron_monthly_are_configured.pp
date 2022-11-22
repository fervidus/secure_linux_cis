# @api private
#
# @summary Ensure permissions on /etc/cron.monthly are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_cron_monthly_are_configured {
  file { '/etc/cron.monthly':
    ensure => directory,
    # schedule => 'harden_schedule',
    group  => 'root',
    owner  => 'root',
    mode   => 'og-rwx',
  }
}
