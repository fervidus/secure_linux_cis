# @api private
# 5 Ensure nodev option set on /dev/shm partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 5 Ensure nodev option set on /dev/shm partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nodev_option_set_on_dev_shm_partition
class secure_linux_cis::rules::ensure_nodev_option_set_on_dev_shm_partition {}
