# @api private
#  Ensure mounting of cramfs filesystems is disabled (Scored)
#
# Description:
# The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems.
# A cramfs image can be used without having to first decompress the image.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the server.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of cramfs filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_cramfs_filesystems_is_disabled
class secure_linux_cis::rules::ensure_mounting_of_cramfs_filesystems_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    kmod::install { 'cramfs':
      command => '/bin/true',
    }
  }
}
