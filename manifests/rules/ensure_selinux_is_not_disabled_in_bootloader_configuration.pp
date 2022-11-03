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
class secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration {
  Class['secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration']
  ~> Class['secure_linux_cis::reboot']
  exec { "grubby --update-kernel ALL --remove-args 'selinux=0 enforcing=0'":
    onlyif => "[[ $(grep -P -- '^\\h*(kernelopts=|linux|kernel)' $(find /boot -type f \\( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \\) -exec grep -Pl -- '^\\h*(kernelopts=|linux|kernel)' {} \\;) | grep -E -- '(selinux=0|enforcing=0)') ]]",
    path   => '/usr/sbin/:/usr/bin/',
  }
}
