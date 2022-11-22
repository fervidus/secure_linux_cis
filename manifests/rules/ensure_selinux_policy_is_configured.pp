# @api private
#
# @summary Ensure SELinux policy is configured 
#
class secure_linux_cis::rules::ensure_selinux_policy_is_configured {
  file_line { 'selinux_targeted':
    path  => '/etc/selinux/config',
    line  => 'SELINUXTYPE=targeted',
    match => '^SELINUXTYPE=',
  }
}
