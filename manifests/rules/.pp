#  Ensure all AppArmor Profiles are enforcing (Scored)
#
#
# Description:
# AppArmor profiles define what resources applications are able to access.
#
# @summary  Ensure all AppArmor Profiles are enforcing (Scored)
#
# @param enforced Should this rule be enforced
# @param mac Which Mandatory Access Control to use
#
# @example
#   include secure_linux_cis::
class secure_linux_cis:: (
  Boolean $enforced = true,
  Enum['selinux', 'apparmor', 'none'] $mac = 'apparmor',
) {

  if $enforced and $mac == 'apparmor' {

    notify {'TODO':
    }
  }
}

