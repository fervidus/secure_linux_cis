# 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_8
class secure_linux_cis::redhat7::cis_1_1_8 (
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
