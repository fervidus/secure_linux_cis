# 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_1_1_9
class secure_linux_cis::distribution::redhat7::cis_1_1_9 (
  Boolean $enforced = true,
) {
  if $enforced {

    $mount = '/var/tmp'
    $option = 'nosuid'

    secure_linux_cis::mount_options { "${mount}-${option}":
      mount => $mount,
      opt   => $option,
    }

  }
}
