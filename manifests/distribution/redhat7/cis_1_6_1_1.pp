# 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
#
#
# Description:
# Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters.
#
# @summary 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_6_1_1
class secure_linux_cis::distribution::redhat7::cis_1_6_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    kernel_parameter { 'quiet':
      ensure   => present,
      bootmode => 'default',
    }

    kernel_parameter { 'selinux=0':
      ensure   => absent,
    }

    kernel_parameter { 'enforcing=0':
      ensure   => absent,
    }
  }
}
