# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_all_logfiles_have_appropriate_permissions_and_ownership
class secure_linux_cis::rules::ensure_all_logfiles_have_appropriate_permissions_and_ownership {
  file { 'audit_all_logfiles_have_appropriate_permissions_and_ownership':
    ensure => file,
    path   => '/root/scripts/audit_all_logfiles_have_appropriate_permissions_and_ownership.sh',
    source => 'puppet:///modules/secure_linux_cis/audit_all_logfiles_have_appropriate_permissions_and_ownership.sh',
    mode   => 'u+x',
  }

  file { 'ensure_all_logfiles_have_appropriate_permissions_and_ownership':
    ensure => file,
    path   => '/root/scripts/ensure_all_logfiles_have_appropriate_permissions_and_ownership.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_all_logfiles_have_appropriate_permissions_and_ownership.sh',
    mode   => 'u+x',
  }

  exec { 'Fix logfile permissions and ownership':
    command => '/root/scripts/ensure_all_logfiles_have_appropriate_permissions_and_ownership.sh',
    unless  => 'cd /root; X=`/root/scripts/audit_all_logfiles_have_appropriate_permissions_and_ownership.sh`; echo "$X" | grep -P -- \'PASS\'',
    require => [
      File['audit_all_logfiles_have_appropriate_permissions_and_ownership'],
      File['ensure_all_logfiles_have_appropriate_permissions_and_ownership']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
