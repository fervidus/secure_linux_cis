# 1.1.3 Ensure nodev option set on /tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.3 Ensure nodev option set on /tmp partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_3
class secure_linux_cis::redhat7::cis_1_1_3 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if $facts['tmp_partition'] {

        if $facts['tmp_nodev'] == false {
          notify { 'tn':
            message  => 'Not in compliance with CIS 1.1.3 (Scored). The nodev option is not set on the /tmp partition',
            loglevel => 'warning',
          }
      }
    }
  }
}
