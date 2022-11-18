# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_no_local_interactive_user_has_forward_files
class secure_linux_cis::rules::ensure_no_local_interactive_user_has_rhosts_files {
  file { 'audit_no_local_interactive_user_has_rhosts_files':
    ensure => file,
    path   => '/root/scripts/audit_no_local_interactive_user_has_rhosts_files.sh',
    source => 'puppet:///modules/secure_linux_cis/audit_no_local_interactive_user_has_rhosts_files.sh',
    mode   => 'u+x',
  }

  file { 'ensure_no_local_interactive_user_has_rhosts_files':
    ensure => file,
    path   => '/root/scripts/ensure_no_local_interactive_user_has_rhosts_files.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_no_local_interactive_user_has_rhosts_files.sh',
    mode   => 'u+x',
  }

  exec { 'Remove local interactive rhosts files':
    command => '/root/scripts/ensure_no_local_interactive_user_has_rhosts_files.sh',
    unless  => 'cd /root; X=`/root/scripts/audit_no_local_interactive_user_has_rhosts_files.sh`; echo "$X" | grep -Pi -- \'PASSED\'',
    require => [
      File['audit_no_local_interactive_user_has_rhosts_files'],
      File['ensure_no_local_interactive_user_has_rhosts_files']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
