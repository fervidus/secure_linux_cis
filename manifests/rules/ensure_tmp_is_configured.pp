# @api private
#  Ensure nodev option set on /tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary  Ensure nodev option set on /tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_tmp_is_configured
class secure_linux_cis::rules::ensure_tmp_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    $mount = '/tmp'
    $option = 'mode=1777,strictatime,noexec,nodev,nosuid'
    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }
  }
}
