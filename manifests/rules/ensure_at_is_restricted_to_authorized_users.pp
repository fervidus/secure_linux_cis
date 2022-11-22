# @api private
#
# @summary Ensure at is restricted to authorized users 
#
class secure_linux_cis::rules::ensure_at_is_restricted_to_authorized_users {
  file { '/etc/at.deny':
    ensure   => absent,
  }

  file { '/etc/at.allow':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 'u-x,og-rwx',
  }
}
