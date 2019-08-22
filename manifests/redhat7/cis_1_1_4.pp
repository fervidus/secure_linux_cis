# 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_4
class secure_linux_cis::redhat7::cis_1_1_4 (
  Boolean $enforced = true,
) {
  if $enforced {

    $mount = '/tmp'
    $option = 'nosuid'

    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }

  }
}
