# 1.1.14 Ensure nodev option set on /home partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.14 Ensure nodev option set on /home partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_14
class secure_linux_cis::redhat7::cis_1_1_14 (
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
