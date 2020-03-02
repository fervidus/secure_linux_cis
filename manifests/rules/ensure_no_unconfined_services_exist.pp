# @api private
#  Ensure no unconfined daemons exist (Scored)
#
#
# Description:
# Unconfined processes run in unconfined domains.
#
# @summary  Ensure no unconfined services exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_unconfined_services_exist
class secure_linux_cis::rules::ensure_no_unconfined_services_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    if $facts['unconf_services'] {
      notify { 'us':
        message  => 'Not in compliance with CIS (Scored). There are unconfined services running on the system',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
