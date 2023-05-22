# @api private
#
# @summary Ensure local interactive user home directories exist
#
class secure_linux_cis::rules::ensure_local_interactive_user_home_directories_exist {
  file { 'audit_local_interactive_user_home_directories_exist':
    ensure => file,
    path   => '/root/scripts/audit_local_interactive_user_home_directories_exist.sh',
    source => 'puppet:///modules/secure_linux_cis/audit_local_interactive_user_home_directories_exist.sh',
    mode   => 'u+x',
  }

  file { 'ensure_local_interactive_user_home_directories_exist':
    ensure => file,
    path   => '/root/scripts/ensure_local_interactive_user_home_directories_exist.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_local_interactive_user_home_directories_exist.sh',
    mode   => 'u+x',
  }

  exec { 'Add local interactive user home directories':
    command  => '/root/scripts/ensure_local_interactive_user_home_directories_exist.sh',
    unless   => '/root/scripts/audit_all_logfiles_have_appropriate_permissions_and_ownership.sh',
    require  => [
      File['audit_local_interactive_user_home_directories_exist'],
      File['ensure_local_interactive_user_home_directories_exist']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
