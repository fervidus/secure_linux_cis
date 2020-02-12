# @param enforced Should this rule be enforced
# @api private
# Ensure AppArmor is enabled in the bootloader configuration (Scored)
#
# Description:
# Configure AppArmor to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters.
#
# @summary Ensure AppArmor is enabled in the bootloader configuration (Scored)
#
# @example
#   include secure_linux_cis::ensure_apparmor_is_not_disabled_in_bootloader_configuration
class secure_linux_cis::rules::ensure_apparmor_is_not_disabled_in_bootloader_configuration(
    Boolean $enforced = true,
) {
  if $enforced {
    kernel_parameter { 'apparmor=1':
      ensure   => present,
    }
    kernel_parameter { 'security=apparmor':
      ensure   => present,
    }
  }
}
