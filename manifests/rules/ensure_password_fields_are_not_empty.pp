# @api private
#
# @summary Ensure password fields are not empty 
#
class secure_linux_cis::rules::ensure_password_fields_are_not_empty {
  if $facts['password_empty'] {
    notify { 'pass_emp':
      message  => 'Not in compliance with CIS  (Scored). Check fact password_empty for the user(s) who do not have a password',
      loglevel => 'warning',
    }
  }
}
