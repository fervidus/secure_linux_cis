# @api private
#  Ensure SELinux policy is configured (Scored)
#
#
# Description:
# Configure SELinux to meet or exceed the default targeted policy, which constrains daemons and system software only.
#
# @summary  Ensure SELinux policy is configured (Scored)
#
# @param enforced Should this rule be enforced
# @param mac Which Mandatory Access Control to use
#
# @example
#   include secure_linux_cis::ensure_selinux_policy_is_configured
class secure_linux_cis::rules::ensure_selinux_policy_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    if $::secure_linux_cis::mac == 'selinux' {
      file_line { 'selinux_targeted':
        schedule => 'harden_schedule',
        path     => '/etc/selinux/config',
        line     => 'SELINUXTYPE=targeted',
        match    => '^SELINUXTYPE=',
      }
    }
  }
}
