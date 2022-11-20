# @api private
#  Ensure no unconfined daemons exist (Scored)
#
# Description:
# Daemons that are not defined in SELinux policy will inherit the security context of their parent process.
#
# @summary  Ensure no unconfined daemons exist (Scored)
#
class secure_linux_cis::rules::ensure_no_unconfined_daemons_exist {
  if $facts['unconf_daemons'] {
    notify { 'ud':
      message  => 'Not in compliance with CIS  (Scored). There are unconfined daemons running on the system',
      loglevel => 'warning',
    }
  }
}
