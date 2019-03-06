# 1.6.1.2 Ensure the SELinux state is enforcing (Scored)
#
#
# Description:
# Set SELinux to enable when the system is booted.
#
# @summary 1.6.1.2 Ensure the SELinux state is enforcing (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_6_1_2
class secure_linux_cis::redhat7::cis_1_6_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'selinux_enforce':
      path     => '/etc/selinux/config',
      line     => 'SELINUX=enforcing',
      match    => 'SELINUX=',
      multiple => true,
    }
  }
}
