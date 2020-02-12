# @api private
# 4 Ensure nodev option set on /home partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 4 Ensure nodev option set on /home partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nodev_option_set_on_home_partition
class secure_linux_cis::rules::ensure_nodev_option_set_on_home_partition(
    Boolean $enforced = true,
) {
  if $enforced {
    $mount = '/home'
    $option = 'nodev'
    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }
  }
}
