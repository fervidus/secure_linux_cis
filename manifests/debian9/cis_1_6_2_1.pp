# 1.6.2.1 Ensure AppArmor is enabled in the bootloader configuration (Scored)
#
#
# Description:
# Configure AppArmor to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters.
#
# @summary 1.6.2.1 Ensure AppArmor is enabled in the bootloader configuration (Scored)
#
# @param enforced Should this rule be enforced
# @param mac Which Mandatory Access Control to use
#
# @example
#   include secure_linux_cis::debian9::cis_1_6_2_1
class secure_linux_cis::debian9::cis_1_6_2_1 (
  Boolean $enforced = true,
  Enum['selinux', 'apparmor', 'none'] $mac = 'apparmor',
) {

  if $enforced and $mac == 'apparmor' {

    kernel_parameter { 'apparmor=1':
      ensure   => present,
    }

    kernel_parameter { 'security=apparmor':
      ensure   => present,
    }
  }
}
