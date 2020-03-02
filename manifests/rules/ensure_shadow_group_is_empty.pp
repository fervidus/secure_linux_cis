# @api private
# Ensure shadow group is empty (Scored)
#
#
# Description:
# The shadow group allows system programs which require access the ability to read the
# /etc/shadow file. No users should be assigned to the shadow group.
#
# @summary Ensure shadow group is empty (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::rules::ensure_shadow_group_is_empty
class secure_linux_cis::rules::ensure_shadow_group_is_empty(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['shadowgroup'].empty {
      notify { 'shadow':
        message  => 'Not in compliance with CIS 6.2.20 (Scored). Someone is a member of the group shadow. Check the shadowgroup fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
