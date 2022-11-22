# @api private
#
# @summary Ensure the SELinux mode is enforcing 
#
class secure_linux_cis::rules::ensure_the_selinux_mode_is_enforcing {
  file_line { 'selinux_enforce':
    path     => '/etc/selinux/config',
    line     => 'SELINUX=enforcing',
    match    => '^SELINUX=',
    multiple => true,
  }
}
