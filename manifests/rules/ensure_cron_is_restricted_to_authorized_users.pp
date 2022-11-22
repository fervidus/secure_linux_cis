# @api private
#
# @summary Ensure cron is restricted to authorized users 
#
class secure_linux_cis::rules::ensure_cron_is_restricted_to_authorized_users {
  file { '/etc/cron.allow':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { '/etc/cron.deny':
    ensure   => absent,
  }
}
