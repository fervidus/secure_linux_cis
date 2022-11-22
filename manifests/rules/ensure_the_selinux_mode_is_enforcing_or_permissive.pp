# @api private
#
# @summary Ensure the SELinux mode is enforcing or permissive 
#
class secure_linux_cis::rules::ensure_the_selinux_mode_is_enforcing_or_permissive {
  file_line { 'selinux_enforce':
    path     => '/etc/selinux/config',
    line     => "SELINUX=${secure_linux_cis::selinux_mode}",
    match    => '^SELINUX=',
    multiple => true,
  }
}
