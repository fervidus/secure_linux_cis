# 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
#
# Description:
# The freevxfs filesystem type is a free version of the Veritas type filesystem.
# This is the primary filesystem type for HP-UX operating systems.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_1_2
class secure_linux_cis::redhat7::cis_1_1_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    kmod::install { 'freevxfs':
      command => '/bin/true',
    }
  }

}
