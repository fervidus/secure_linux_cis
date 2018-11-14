# 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
#
# Description:
# The jffs2 (journaling flash filesystem 2) filesystem type is a log-structured filesystem used in flash memory devices.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_1_3
class secure_linux_cis::redhat7::cis_1_1_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    kmod::install { 'jffs2':
      command => '/bin/true',
    }
  }

}
