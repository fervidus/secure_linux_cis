# @api private
#  Ensure password fields are not empty (Scored)
#
#
# Description:
# An account with an empty password field means that anybody may log in as that user without providing a password.
#
# @summary  Ensure password fields are not empty (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_password_fields_are_not_empty
class secure_linux_cis::rules::ensure_password_fields_are_not_empty(
    Boolean $enforced = true,
) {
  if $enforced {
    if $facts['password_empty'] {
      notify{'pass_emp':
        message  => 'Not in compliance with CIS  (Scored). Check fact password_empty for the user(s) who do not have a password',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
