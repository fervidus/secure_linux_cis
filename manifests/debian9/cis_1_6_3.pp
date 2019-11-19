# 1.6.3 Ensure SELinux or AppArmor are installed (Scored)
#
#
# Description:
# SELinux and AppArmor provide Mandatory Access Controls.
#
# @summary 1.6.3 Ensure SELinux or AppArmor are installed (Scored)
#
# @param enforced Should this rule be enforced
# @param mac Which Mandatory Access Control to use
#
# @example
#   include secure_linux_cis::debian9::cis_1_6_3
class secure_linux_cis::debian9::cis_1_6_3 (
  Boolean $enforced = true,
  Enum['selinux', 'apparmor', 'none'] $mac = 'apparmor',
) {

  case $mac {
    'selinux': {
      $packages = ['selinux-basics', 'selinux-policy-default']
    }
    'apparmor': {
      $packages = ['apparmor', 'apparmor-utils']
    }
    default: {
    }
  }

  if $enforced {

    package { $packages:
      ensure => installed,
    }
  }
}
