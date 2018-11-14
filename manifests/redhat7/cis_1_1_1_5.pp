# 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)
#
# Description:
# The hfsplus filesystem type is a hierarchical filesystem designed to replace hfs that allows you to mount Mac OS filesystems.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_1_5
class secure_linux_cis::redhat7::cis_1_1_1_5 (
  Boolean $enforced = true,
) {

  if $enforced {
    kmod::install { 'hfsplus':
      command => '/bin/true',
    }
  }

}
