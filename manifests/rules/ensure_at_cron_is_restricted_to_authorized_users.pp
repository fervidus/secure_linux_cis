# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_at_cron_is_restricted_to_authorized_users {
  file { ['/etc/cron.deny', '/etc/at.deny']:
    ensure => absent,
  }

  file { ['/etc/cron.allow', '/etc/at.allow']:
    ensure => file,
    owner  => root,
    group  => root,
    mode   => 'og-rwx',
  }
}
