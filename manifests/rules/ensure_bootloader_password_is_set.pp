#  Ensure bootloader password is set (Scored)
#
#
# Description:
# Setting the boot loader password will require that anyone rebooting the system must enter a password
# before being able to set command line boot parameters
#
# @summary  Ensure bootloader password is set (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_bootloader_password_is_set
class secure_linux_cis::rules::ensure_bootloader_password_is_set(
    Boolean $enforced = true,
) {
  if $enforced {
    if $facts['grub_pass'] == undef {
      notify { 'gp':
        message  => 'Not in compliance with CIS (Scored). The Grub bootloader does not have a set password. If using a bootloader other than this message, please ensure that an encrypted password is set', #lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
