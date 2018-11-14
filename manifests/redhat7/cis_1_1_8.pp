# 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_8
class secure_linux_cis::redhat7::cis_1_1_8 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if !($facts['var_tmp_partition'].empty) {

        if $facts['var_tmp_partition_nodev'] == false {
          notify { 'vtpp':
            message  => 'Not in compliance with CIS 1.1.8 (Scored). The /var/tmp partition does not have the nodev option set',
            loglevel => 'warning',
        }
      }
    }
  }
}
