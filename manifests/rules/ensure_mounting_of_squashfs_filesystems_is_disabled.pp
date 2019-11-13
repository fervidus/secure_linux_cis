#  Ensure mounting of squashfs filesystems is disabled (Scored)
#
# Description:
# The squashfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems (similar to cramfs ).
#  A squashfs image can be used without having to first decompress the image.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of squashfs filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_squashfs_filesystems_is_disabled
class secure_linux_cis::ensure_mounting_of_squashfs_filesystems_is_disabled (
  Boolean $enforced = true,
) {

  if $enforced {
    kmod::install { 'squashfs':
      command => '/bin/true',
    }
  }

}
