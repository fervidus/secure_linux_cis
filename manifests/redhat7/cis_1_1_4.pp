# 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_4
class secure_linux_cis::redhat7::cis_1_1_4 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if $facts['tmp_partition'] {

        if $facts['tmp_nosuid'] == false {
          notify { 'tnos':
            message  => 'Not in compliance with CIS 1.1.4 (Scored). The nosuid option is not set on the /tmp partition',
            loglevel => 'warning',
            }
        }
    }
  }
}
