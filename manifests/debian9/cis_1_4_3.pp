# 1.4.3 Ensure authentication required for single user mode (Scored)
#
#
# Description:
# Single user mode is used for recovery when the system detects an issue during boot or by
# manual selection from the bootloader.
#
# @summary 1.4.3 Ensure authentication required for single user mode (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::debian9::cis_1_4_3
class secure_linux_cis::debian9::cis_1_4_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    if ($facts['rootpw`'].empty) {

      notify { 'rootpw':
        message  => 'Not in compliance with CIS 1.4.3 (Scored). No authentication required for single user mode.',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
