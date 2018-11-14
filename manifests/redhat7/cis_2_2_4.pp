# 2.2.4 Ensure CUPS is not enabled (Scored)
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
# @summary 2.2.4 Ensure CUPS is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_4
class secure_linux_cis::redhat7::cis_2_2_4 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'cups':
      ensure => stopped,
      enable => false,
    }
  }
}
