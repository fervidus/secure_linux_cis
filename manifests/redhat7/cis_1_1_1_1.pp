# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
#
# Description:
# The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems.
# A cramfs image can be used without having to first decompress the image.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the server.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_1_1
class secure_linux_cis::redhat7::cis_1_1_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    kmod::install { 'cramfs':
      command => '/bin/true',
    }
  }

}
