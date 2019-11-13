#  Ensure the SELinux state is enforcing (Scored)
#
#
# Description:
# Set SELinux to enable when the system is booted.
#
# @summary  Ensure the SELinux state is enforcing (Scored)
#
# @param enforced Should this rule be enforced
# @param mac Which Mandatory Access Control to use
#
# @example
#   include secure_linux_cis::ensure_the_selinux_state_is_enforcing
class secure_linux_cis::ensure_the_selinux_state_is_enforcing (
  Boolean $enforced = true,
  Enum['selinux', 'apparmor', 'none'] $mac = 'selinux',
) {

  if $enforced  and $mac == 'selinux' {
    file_line { 'selinux_enforce':
      path     => '/etc/selinux/config',
      line     => 'SELINUX=enforcing',
      match    => 'SELINUX=',
      multiple => true,
    }
  } elsif $mac == 'selinux' {
    file_line { 'selinux_disable':
      path     => '/etc/selinux/config',
      line     => 'SELINUX=disabled',
      match    => 'SELINUX=',
      multiple => true,
    }
  }
}
