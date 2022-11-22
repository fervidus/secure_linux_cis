# @api private
#
# @summary Ensure system accounts are secured 
#
class secure_linux_cis::rules::ensure_system_accounts_are_secured {
  # unless $facts['insecure_system_accounts'] {
  #   warning('Insecure system accounts are present.')
  # }

  file { '/root/scripts/login_nologin_system_accounts.sh':
    ensure => file,
    source => 'puppet:///modules/secure_linux_cis/login_nologin_system_accounts.sh',
    mode   => 'u+x',
  }
  -> file { '/root/scripts/audit_nologin_system_accounts.sh':
    ensure => file,
    source => 'puppet:///modules/secure_linux_cis/audit_nologin_system_accounts.sh',
    mode   => 'u+x',
  }
  -> exec { 'Set all system accounts to a non login shell':
    command => '/root/scripts/login_nologin_system_accounts.sh',
    unless  => 'test -z `/root/scripts/audit_nologin_system_accounts.sh`',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }

  file { '/root/scripts/lock_unlocked_system_accounts.sh':
    ensure => file,
    source => 'puppet:///modules/secure_linux_cis/lock_unlocked_system_accounts.sh',
    mode   => 'u+x',
  }
  -> file { '/root/scripts/audit_unlocked_system_accounts.sh':
    ensure => file,
    source => 'puppet:///modules/secure_linux_cis/audit_unlocked_system_accounts.sh',
    mode   => 'u+x',
  }
  -> exec { 'Lock not root system accounts':
    command => '/root/scripts/lock_unlocked_system_accounts.sh',
    unless  => 'test -z `/root/scripts/audit_unlocked_system_accounts.sh`',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
