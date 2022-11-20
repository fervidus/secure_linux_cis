# @api private
#  Ensure no unconfined daemons exist (Scored)
#
# Description:
# Unconfined processes run in unconfined domains.
#
# @summary  Ensure no unconfined services exist (Scored)
#
class secure_linux_cis::rules::ensure_no_unconfined_services_exist {
  if $facts['unconf_services'] {
    notify { 'us':
      message  => 'Not in compliance with CIS (Scored). There are unconfined services running on the system',
      loglevel => 'warning',
    }
  }
}
