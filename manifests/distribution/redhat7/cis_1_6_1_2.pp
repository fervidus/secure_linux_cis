# 1.6.1.2 Ensure the SELinux state is enforcing (Scored)
#
#
# Description:
# Set SELinux to enable when the system is booted.
#
# @summary 1.6.1.2 Ensure the SELinux state is enforcing (Scored)
#
# @param enforced Should this rule be enforced
# @param mac Which Mandatory Access Control to use
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_6_1_2
class secure_linux_cis::distribution::redhat7::cis_1_6_1_2 (
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
