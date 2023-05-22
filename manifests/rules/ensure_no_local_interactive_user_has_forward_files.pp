# @api private
#
# @summary Ensure no local interactive user has .forward files
#
class secure_linux_cis::rules::ensure_no_local_interactive_user_has_forward_files {
  file { 'audit_no_local_interactive_user_has_forward_files':
    ensure => file,
    path   => '/root/scripts/audit_no_local_interactive_user_has_forward_files.sh',
    source => 'puppet:///modules/secure_linux_cis/audit_no_local_interactive_user_has_forward_files.sh',
    mode   => 'u+x',
  }

  file { 'ensure_no_local_interactive_user_has_forward_files':
    ensure => file,
    path   => '/root/scripts/ensure_no_local_interactive_user_has_forward_files.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_no_local_interactive_user_has_forward_files.sh',
    mode   => 'u+x',
  }

  exec { 'Remove local interactive forward files':
    command => '/root/scripts/ensure_no_local_interactive_user_has_forward_files.sh',
    unless  => '/root/scripts/audit_no_local_interactive_user_has_forward_files.sh',
    require => [
      File['audit_no_local_interactive_user_has_forward_files'],
      File['ensure_no_local_interactive_user_has_forward_files']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
