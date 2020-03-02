# @api private
#  Ensure permissions on bootloader config are configured (Scored)
#
#
# Description:
# The grub configuration file contains information on boot settings and passwords for unlocking boot options.
# The grub configuration is usually located at /boot/grub2/grub.cfg and linked as /etc/grub2.cfg. Additional settings can be found in the
# /boot/grub2/user.cfg file.
#
# @summary  Ensure permissions on bootloader config are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_bootloader_config_are_configured
class secure_linux_cis::rules::ensure_permissions_on_bootloader_config_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    file { $::secure_linux_cis::grub_config_files:
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0600',
    }
  }
}
