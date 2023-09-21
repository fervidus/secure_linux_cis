# @api private
#
# @summary Ensure root password is set
#
class secure_linux_cis::rules::ensure_root_password_is_set {
  if $facts['root_password_empty'] {
    notify { 'root_pass_emp':
      message  => 'Not in compliance with CIS (Scored). Root passwort is empty (check fact root_password_empty is set)',
      loglevel => 'warning',
    }
  }
}
