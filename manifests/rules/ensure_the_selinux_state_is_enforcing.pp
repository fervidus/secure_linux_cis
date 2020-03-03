# @param enforced Should this rule be enforced
# @api private
#  Ensure the SELinux state is enforcing (Scored)
#
#
# Description:
# Set SELinux to enable when the system is booted.
#
# @summary  Ensure the SELinux state is enforcing (Scored)
#
# @example
#   include secure_linux_cis::ensure_the_selinux_state_is_enforcing
class secure_linux_cis::rules::ensure_the_selinux_state_is_enforcing(
    Boolean $enforced = true,
) {
  if $enforced {
    if $::secure_linux_cis::mac == 'selinux' {
      file_line { 'selinux_enforce':
        schedule => 'harden_schedule',
        path     => '/etc/selinux/config',
        line     => 'SELINUX=enforcing',
        match    => '^SELINUX=',
        multiple => true,
      }
    }
  }
}
