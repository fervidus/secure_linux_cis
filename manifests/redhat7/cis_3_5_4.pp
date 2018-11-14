# 3.5.4 Ensure TIPC is disabled (Not Scored)
#
# # Description:
# The Transparent Inter-Process Communication (TIPC) protocol is designed to provide
# communication between cluster nodes.
#
# Rationale:
# If the protocol is not being used, it is recommended that kernel module not be loaded,
# disabling the service to reduce the potential attack surface.
#
# @summary 3.5.4 Ensure TIPC is disabled (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_5_4
class secure_linux_cis::redhat7::cis_3_5_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    kmod::install { 'tipc':
      command => '/bin/true',
    }
  }
}
