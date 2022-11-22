# @api private
#
# @summary Ensure local interactive users own their home directories 
#
class secure_linux_cis::rules::ensure_local_interactive_users_own_their_home_directories {
  file { 'audit_local_interactive_users_own_their_home_directories':
    ensure => file,
    path   => '/root/scripts/audit_local_interactive_users_own_their_home_directories.sh',
    source => 'puppet:///modules/secure_linux_cis/audit_local_interactive_users_own_their_home_directories.sh',
    mode   => 'u+x',
  }

  file { 'ensure_local_interactive_users_own_their_home_directories':
    ensure => file,
    path   => '/root/scripts/ensure_local_interactive_users_own_their_home_directories.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_local_interactive_users_own_their_home_directories.sh',
    mode   => 'u+x',
  }

  exec { 'Fix home directories ownership for interactive users':
    command => '/root/scripts/ensure_local_interactive_users_own_their_home_directories.sh',
    unless  => 'cd /root; X=`/root/scripts/audit_local_interactive_users_own_their_home_directories.sh`; echo "$X" | grep -Pi -- \'PASSED\'',
    require => [
      File['audit_local_interactive_users_own_their_home_directories'],
      File['ensure_local_interactive_users_own_their_home_directories']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
