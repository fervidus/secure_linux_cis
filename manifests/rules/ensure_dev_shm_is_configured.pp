# @api private
# 5 Ensure nodev option set on /dev/shm partition (Scored)
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 5 Ensure nodev option set on /dev/shm partition (Scored)
#
class secure_linux_cis::rules::ensure_dev_shm_is_configured {
  $mount   = '/dev/shm'

  mount { $mount:
    device => $mount,
    fstype => 'tmpfs',
    atboot => true,
  }
}
