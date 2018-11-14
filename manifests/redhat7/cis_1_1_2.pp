# 1.1.2 Ensure separate partition exists for /tmp (Scored)
#
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage by all users and some applications.
#
# @summary 1.1.2 Ensure separate partition exists for /tmp (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_2
class secure_linux_cis::redhat7::cis_1_1_2 (
  Boolean $enforced = true,
  ) {

    if $enforced {

      if $facts['tmp_partition'] == undef {

        notify { 'tmp-part':
          message => 'Not in compliance with CIS 1.1.2 (Scored). There is not a seperate partition for /tmp',
          }
        }
    }
}
