# 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_15
class secure_linux_cis::redhat7::cis_1_1_15 (
  Boolean $enforced = true,
) {
# this class manages cis_1_1_15, cis_1_1_16 and cis_1_1_17 as /dev/shm is not listed in /etc/fstab by default and mount_options.pp fails

  $mount   = '/dev/shm'
  $options = 'nodev,nosuid,noexec'

  if $enforced {

    if $facts['mountpoints'][$mount] {

      mount { $mount:
          device  => $mount,
          fstype  => 'tmpfs',
          options => $options,
          atboot  => true,
      }
    }
  }
}
