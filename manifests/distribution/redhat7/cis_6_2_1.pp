# 6.2.1 Ensure password fields are not empty (Scored)
#
#
# Description:
# An account with an empty password field means that anybody may log in as that user without providing a password.
#
# @summary 6.2.1 Ensure password fields are not empty (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_6_2_1
class secure_linux_cis::distribution::redhat7::cis_6_2_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    if $facts['password_empty'] {

      notify{'pass_emp':
        message  => 'Not in compliance with CIS 6.2.1 (Scored). Check fact password_empty for the user(s) who do not have a password',
        loglevel => 'warning',
      }
    }
  }
}
