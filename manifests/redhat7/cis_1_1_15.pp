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

  if $enforced {

    $mount = '/dev/shm'
    $option = 'nodev'

    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }

  }
}
