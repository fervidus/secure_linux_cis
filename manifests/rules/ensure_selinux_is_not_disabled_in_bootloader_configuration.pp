# @api private
#  Ensure SELinux is not disabled in bootloader configuration (Scored)
#
#
# Description:
# Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters.
#
# @summary  Ensure SELinux is not disabled in bootloader configuration (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_selinux_is_not_disabled_in_bootloader_configuration
class secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration']
  ~> Class['secure_linux_cis::reboot']

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
