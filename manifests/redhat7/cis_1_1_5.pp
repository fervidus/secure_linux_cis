# 1.1.5 Ensure noexec option set on /tmp partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 1.1.5 Ensure noexec option set on /tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_5
class secure_linux_cis::redhat7::cis_1_1_5 (
  Boolean $enforced = true,
) {
  if $enforced {

    $mount = '/tmp'
    $option = 'noexec'

    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }

  }
}



