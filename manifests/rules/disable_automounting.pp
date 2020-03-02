# @api private
# 2 Disable Automounting (Scored)
#
#
# Description:
# autofs allows automatic mounting of devices, typically including CD/DVDs and USB drives.
#
# @summary 2 Disable Automounting (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::disable_automounting
class secure_linux_cis::rules::disable_automounting(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'autofs':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
