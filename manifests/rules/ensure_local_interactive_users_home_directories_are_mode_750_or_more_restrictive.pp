# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_local_interactive_users_home_directories_are_mode_750_or_more_restrictive
class secure_linux_cis::rules::ensure_local_interactive_users_home_directories_are_mode_750_or_more_restrictive {
  file { 'audit_local_interactive_users_home_directories_are_mode_750_or_more_restrictive':
    ensure => file,
    path   => '/root/scripts/audit_local_interactive_users_home_directories_are_mode_750_or_more_restrictive.sh',
    source => 'puppet:///modules/secure_linux_cis/audit_local_interactive_users_home_directories_are_mode_750_or_more_restrictive.sh',
    mode   => 'u+x',
  }

  file { 'ensure_local_interactive_users_home_directories_are_mode_750_or_more_restrictive':
    ensure => file,
    path   => '/root/scripts/ensure_local_interactive_users_home_directories_are_mode_750_or_more_restrictive.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_local_interactive_users_home_directories_are_mode_750_or_more_restrictive.sh',
    mode   => 'u+x',
  }

  exec { 'Fix interactive user home directories permissions':
    command => '/root/scripts/ensure_local_interactive_users_home_directories_are_mode_750_or_more_restrictive.sh',
    unless  => 'cd /root; X=`/root/scripts/audit_local_interactive_users_home_directories_are_mode_750_or_more_restrictive.sh`; echo "$X" | grep -Pi -- \'PASSED\'',
    require => [
      File['audit_local_interactive_users_home_directories_are_mode_750_or_more_restrictive'],
      File['ensure_local_interactive_users_home_directories_are_mode_750_or_more_restrictive']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
