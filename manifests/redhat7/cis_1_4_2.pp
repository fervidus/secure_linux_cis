# 1.4.2 Ensure bootloader password is set (Scored)
#
#
# Description:
# Setting the boot loader password will require that anyone rebooting the system must enter a password
# before being able to set command line boot parameters
#
# @summary 1.4.2 Ensure bootloader password is set (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_4_2
  class secure_linux_cis::redhat7::cis_1_4_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    if $facts['grub_pass'] == undef {

      notify { 'gp':
        message  => 'Not in compliance with CIS 1.4.2 (Scored). The Grub bootloader does not have a set password. If using a bootloader other than this message, please ensure that an encrypted password is set', #lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
