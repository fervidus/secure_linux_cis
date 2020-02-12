# @api private
#  Ensure mounting of hfs filesystems is disabled (Scored)
#
# Description:
# The hfs filesystem type is a hierarchical filesystem that allows you to mount Mac OS filesystems.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of hfs filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_hfs_filesystems_is_disabled
class secure_linux_cis::rules::ensure_mounting_of_hfs_filesystems_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    kmod::install { 'hfs':
      command => '/bin/true',
    }
  }
}
