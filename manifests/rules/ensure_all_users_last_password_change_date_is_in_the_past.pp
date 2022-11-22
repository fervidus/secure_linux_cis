# @api private
#
# @summary Ensure all users last password change date is in the past 
#
class secure_linux_cis::rules::ensure_all_users_last_password_change_date_is_in_the_past {
  # local_users fact may be undef
  $local_users = pick($facts['local_users'], {})
  $local_users.each |String $user, Hash $attributes| {
    unless $attributes['password_date_valid'] {
      # fail("User ${user} has a password last changed date in the future. Please investigate.")
      notify { "plcd ${user}":
        message  => 'Not in compliance with CIS  (Scored). We believe the user has a password last changed date in the future. Please investigate.', #lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
