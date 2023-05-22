# @api private
#
# @summary Ensure all logfiles have appropriate permissions and ownership
#
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
    command  => '/root/scripts/ensure_all_logfiles_have_appropriate_permissions_and_ownership.sh',
    unless   => '/root/scripts/audit_all_logfiles_have_appropriate_permissions_and_ownership.sh',
    require  => [
      File['audit_all_logfiles_have_appropriate_permissions_and_ownership'],
      File['ensure_all_logfiles_have_appropriate_permissions_and_ownership']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
