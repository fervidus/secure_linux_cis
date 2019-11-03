# 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
#
# @param enforced Should this rule be enforced
#
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_1_16
class secure_linux_cis::distribution::redhat7::cis_1_1_16 (
  Boolean $enforced = true,
) {
# this requirement is managed in cis_1_1_15

#  if $enforced {

#  }
}
