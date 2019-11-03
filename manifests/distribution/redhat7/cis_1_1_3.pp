# 1.1.3 Ensure nodev option set on /tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.3 Ensure nodev option set on /tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_1_3
class secure_linux_cis::distribution::redhat7::cis_1_1_3 (
  Boolean $enforced = true,
) {
  if $enforced {

    $mount = '/tmp'
    $option = 'nodev'

    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }

  }
}
