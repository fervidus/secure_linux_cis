# @api private
#  Ensure mounting of FAT filesystems is disabled (Scored)
#
# Description:
# The FAT filesystem format is primarily used on older windows systems and portable USB drives or flash modules.
# It comes in three types FAT12 , FAT16 , and FAT32 all of which are supported by the vfat kernel module.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of FAT filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_vfat_filesystems_is_limited
class secure_linux_cis::rules::ensure_mounting_of_vfat_filesystems_is_limited(
    Boolean $enforced = true,
) {
  if $enforced {
    kmod::install { 'vfat':
      command => '/bin/true',
    }
  }
}
