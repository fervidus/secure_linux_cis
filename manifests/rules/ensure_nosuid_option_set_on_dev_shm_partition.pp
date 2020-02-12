# @api private
# 6 Ensure nosuid option set on /dev/shm partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 6 Ensure nosuid option set on /dev/shm partition (Scored)
#
# @param enforced Should this rule be enforced
#
#
# @example
#   include secure_linux_cis::ensure_nosuid_option_set_on_dev_shm_partition
class secure_linux_cis::rules::ensure_nosuid_option_set_on_dev_shm_partition { }
# this requirement is managed in cis_1_1_15
##  }
