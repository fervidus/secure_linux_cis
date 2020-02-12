# @api private
#  Ensure nodev option set on /var/tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary  Ensure nodev option set on /var/tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nodev_option_set_on_var_tmp_partition
class secure_linux_cis::rules::ensure_nodev_option_set_on_var_tmp_partition(
    Boolean $enforced = true,
) {
  if $enforced {
    $mount = '/var/tmp'
    $option = 'nodev'
    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }
  }
}
