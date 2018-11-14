# 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_10
class secure_linux_cis::redhat7::cis_1_1_10 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if !($facts['var_tmp_partition'].empty) {

        if $facts['var_tmp_partition_noexec'] == false {
          notify { 'vtpne':
            message  => 'Not in compliance with CIS 1.1.10 (Scored). The noexec option is not set on the /var/tmp partition',
            loglevel => 'warning',
          }
        }
      }
    }
}
