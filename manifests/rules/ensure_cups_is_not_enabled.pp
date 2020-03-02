# @api private
#  Ensure CUPS is not enabled (Scored)
#
# Description:
# The Common Unix Print System (CUPS) provides the ability to print to both local and network printers.
# A system running CUPS can also accept print jobs from remote systems and print them to local printers.
# It also provides a web based remote administration capability.
#
# Rationale:
# If the system does not need to print jobs or accept print jobs from other systems,
# it is recommended that CUPS be disabled to reduce the potential attack surface.
#
# @summary  Ensure CUPS is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_cups_is_not_enabled
class secure_linux_cis::rules::ensure_cups_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'cups':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
