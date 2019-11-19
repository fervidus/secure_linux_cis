# 1.6.1.3 Ensure SELinux policy is configured (Scored)
#
#
# Description:
# Configure SELinux to meet or exceed the default targeted policy, which constrains daemons and system software only.
#
# @summary 1.6.1.3 Ensure SELinux policy is configured (Scored)
#
# @param enforced Should this rule be enforced
# @param mac Which Mandatory Access Control to use
#
# @example
#   include secure_linux_cis::redhat7::cis_1_6_1_3
class secure_linux_cis::redhat7::cis_1_6_1_3 (
  Boolean $enforced = true,
  Enum['selinux', 'apparmor', 'none'] $mac = 'selinux',
) {

  if $enforced and $mac == 'selinux' {

    file_line { 'selinux_targeted':
      path  => '/etc/selinux/config',
      line  => 'SELINUXTYPE=targeted',
      match => '^SELINUXTYPE=',
    }

  }
}
