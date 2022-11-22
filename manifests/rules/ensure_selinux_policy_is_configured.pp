# @api private
#
# @summary Ensure SELinux policy is configured 
#
class secure_linux_cis::rules::ensure_selinux_policy_is_configured {
  if $secure_linux_cis::mac == 'selinux' {
    file_line { 'selinux_targeted':
      path  => '/etc/selinux/config',
      line  => 'SELINUXTYPE=targeted',
      match => '^SELINUXTYPE=',
    }
  }
}
