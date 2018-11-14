# 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)
#
# Description:
# The udf filesystem type is the universal disk format used to implement ISO/IEC 13346 and ECMA-167 specifications.
# This is an open vendor filesystem type for data storage on a broad range of media.
# This filesystem type is necessary to support writing DVDs and newer optical disc formats.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_1_7
class secure_linux_cis::redhat7::cis_1_1_1_7 (
  Boolean $enforced = true,
) {

  if $enforced {
    kmod::install { 'udf':
      command => '/bin/true',
    }
  }

}
