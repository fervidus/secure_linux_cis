# @api private
#
# @summary Ensure no unconfined services exist 
#
class secure_linux_cis::rules::ensure_no_unconfined_services_exist {
  if $facts['unconf_services'] {
    notify { 'us':
      message  => 'Not in compliance with CIS (Scored). There are unconfined services running on the system',
      loglevel => 'warning',
    }
  }
}
