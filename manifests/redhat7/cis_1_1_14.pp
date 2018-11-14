# 1.1.14 Ensure nodev option set on /home partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.14 Ensure nodev option set on /home partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_14
class secure_linux_cis::redhat7::cis_1_1_14 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if !($facts['mount_home'].empty) and $facts['home_nodev'] == undef {

        notify { 'hn':
          message  => 'Not in compliance with CIS 1.1.14 (Scored). The "nodev" option is not included on the home partition',
          loglevel => 'warning',
        }
      }
    }
}
