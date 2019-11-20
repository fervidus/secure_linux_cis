#  Ensure nosuid option set on /tmp partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary  Ensure nosuid option set on /tmp partition (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nosuid_option_set_on_tmp_partition

class secure_linux_cis::rules::ensure_nosuid_option_set_on_tmp_partition {
  $mount = '/tmp'
  $option = 'nosuid'

  secure_linux_cis::mount_options { "${mount}-${option}":
    mount => $mount,
    opt   => $option,
  }

}
