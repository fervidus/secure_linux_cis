# 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
#
# Description:
# The squashfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems (similar to cramfs ).
#  A squashfs image can be used without having to first decompress the image.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_1_6
class secure_linux_cis::redhat7::cis_1_1_1_6 (
  Boolean $enforced = true,
) {

  if $enforced {
    kmod::install { 'squashfs':
      command => '/bin/true',
    }
  }

}
