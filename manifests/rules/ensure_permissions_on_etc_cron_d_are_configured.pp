# @api private
#
# @summary Ensure permissions on /etc/cron.d are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_cron_d_are_configured {
  file { '/etc/cron.d':
    ensure => directory,
    group  => 'root',
    owner  => 'root',
    mode   => '0700',
  }
}
