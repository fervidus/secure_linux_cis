# @api private
#
# @summary Ensure permissions on /etc/crontab are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_crontab_are_configured {
  file { '/etc/crontab':
    ensure => directory,
    group  => 'root',
    owner  => 'root',
    mode   => 'og-rwx',
  }
}
