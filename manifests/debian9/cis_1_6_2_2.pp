# 1.6.2.2 Ensure all AppArmor Profiles are enforcing (Scored)
#
#
# Description:
# AppArmor profiles define what resources applications are able to access.
#
# @summary 1.6.2.2 Ensure all AppArmor Profiles are enforcing (Scored)
#
# @param enforced Should this rule be enforced
# @param mac Which Mandatory Access Control to use
#
# @example
#   include secure_linux_cis::debian9::cis_1_6_2_2
class secure_linux_cis::debian9::cis_1_6_2_2 (
  Boolean $enforced = true,
  Enum['selinux', 'apparmor', 'none'] $mac = 'apparmor',
) {

  if $enforced and $mac == 'apparmor' {

    notify {'TODO':
    }
  }
}

