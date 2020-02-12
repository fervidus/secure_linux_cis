# @api private
#  Ensure mounting of hfsplus filesystems is disabled (Scored)
#
# Description:
# The hfsplus filesystem type is a hierarchical filesystem designed to replace hfs that allows you to mount Mac OS filesystems.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of hfsplus filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_hfsplus_filesystems_is_disabled
class secure_linux_cis::rules::ensure_mounting_of_hfsplus_filesystems_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    kmod::install { 'hfsplus':
      command => '/bin/true',
    }
  }
}
