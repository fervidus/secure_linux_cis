# @api private
# 7 Ensure noexec option set on /dev/shm partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 7 Ensure noexec option set on /dev/shm partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_noexec_option_set_on_dev_shm_partition
class secure_linux_cis::rules::ensure_noexec_option_set_on_dev_shm_partition { }
# this requirement is managed in cis_1_1_15
##  }
