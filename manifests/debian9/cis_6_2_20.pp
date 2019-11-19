# 6.2.20 Ensure shadow group is empty (Scored)
#
#
# Description:
# The shadow group allows system programs which require access the ability to read the
# /etc/shadow file. No users should be assigned to the shadow group.
#
# @summary 6.2.20 Ensure shadow group is empty (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::debian9::cis_6_2_20
class secure_linux_cis::debian9::cis_6_2_20 (
  Boolean $enforced = true,
) {

  if $enforced {

    if !($facts['shadowgroup'].empty) {

      notify { 'shadow':
        message  => 'Not in compliance with CIS 6.2.20 (Scored). Someone is a member of the group shadow. Check the shadowgroup fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
