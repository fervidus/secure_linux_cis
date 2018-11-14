# 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
#
# Description:
# The hfs filesystem type is a hierarchical filesystem that allows you to mount Mac OS filesystems.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_1_4
class secure_linux_cis::redhat7::cis_1_1_1_4 (
  Boolean $enforced = true,
) {

  if $enforced {
    kmod::install { 'hfs':
      command => '/bin/true',
    }
  }

}
