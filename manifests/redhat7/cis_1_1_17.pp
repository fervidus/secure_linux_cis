# 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_17
class secure_linux_cis::redhat7::cis_1_1_17 (
  Boolean $enforced = true,
) {

  if $enforced {

    $mount = '/dev/shm'
    $option = 'noexec'

    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }

  }
}

