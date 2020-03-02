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
class secure_linux_cis::rules::ensure_nodev_option_set_on_dev_shm_partition(
    Boolean $enforced = true,
) {
  if $enforced {
# this class manages cis_1_1_15, cis_1_1_16 and cis_1_1_17 as /dev/shm is not listed in /etc/fstab by default and mount_options.pp fails
    $mount   = '/dev/shm'
    $options = 'nodev,nosuid,noexec'
    if $facts['mountpoints'][$mount] {
      mount { $mount:
        device   => $mount,
        schedule => 'harden_schedule',
        fstype   => 'tmpfs',
        options  => $options,
        atboot   => true,
      }
    }
  }
}
