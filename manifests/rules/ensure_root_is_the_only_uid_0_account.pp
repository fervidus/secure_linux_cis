# @api private
#  Ensure root is the only UID 0 account (Scored)
#
#
# Description:
# Any account with UID 0 has superuser privileges on the system.
#
# @summary  Ensure root is the only UID 0 account (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_root_is_the_only_uid_0_account
class secure_linux_cis::rules::ensure_root_is_the_only_uid_0_account(
    Boolean $enforced = true,
) {
  if $enforced {
    if $facts['root_uid'] and $facts[ 'root_uid'] != 'root' {
      notify { 'ru':
        message  => 'Not in compliance with CIS  (Scored). One or more users have superuser privileges on the system other than Root. Check the root_uid fact for details', # lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
