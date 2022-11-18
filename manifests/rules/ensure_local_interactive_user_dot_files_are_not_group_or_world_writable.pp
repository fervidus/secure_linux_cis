# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_local_interactive_user_dot_files_are_not_group_or_world_writable
class secure_linux_cis::rules::ensure_local_interactive_user_dot_files_are_not_group_or_world_writable {
  file { 'audit_local_interactive_user_dot_files_are_not_group_or_world_writable':
    ensure => file,
    path   => '/root/scripts/audit_local_interactive_user_dot_files_are_not_group_or_world_writable.sh',
    source => 'puppet:///modules/secure_linux_cis/audit_local_interactive_user_dot_files_are_not_group_or_world_writable.sh',
    mode   => 'u+x',
  }

  file { 'ensure_local_interactive_user_dot_files_are_not_group_or_world_writable':
    ensure => file,
    path   => '/root/scripts/ensure_local_interactive_user_dot_files_are_not_group_or_world_writable.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_local_interactive_user_dot_files_are_not_group_or_world_writable.sh',
    mode   => 'u+x',
  }

  exec { 'Remove group and world writable dfrpm user dot files':
    command => '/root/scripts/ensure_local_interactive_user_dot_files_are_not_group_or_world_writable.sh',
    unless  => 'cd /root; X=`/root/scripts/audit_local_interactive_user_dot_files_are_not_group_or_world_writable.sh`; echo "$X" | grep -Pi -- \'PASSED\'',
    require => [
      File['audit_local_interactive_user_dot_files_are_not_group_or_world_writable'],
      File['ensure_local_interactive_user_dot_files_are_not_group_or_world_writable']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
