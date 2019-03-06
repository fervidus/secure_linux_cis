# 5.4.1.5 Ensure all users last password change date is in the past (Scored)
#
# Description:
# All users should have a password change date in the past.
#
# Rationale:
# If a users recorded password change date is in the future then they could bypass any set password expiration.
#
# @summary 5.4.1.5 Ensure all users last password change date is in the past (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_4_1_5
  class secure_linux_cis::redhat7::cis_5_4_1_5 (
  Boolean $enforced = true,
) {

  if $enforced {

    if $facts['local_users'].empty {
      #do nothing
    }
    else {
      $facts['local_users'].each |String $user, Hash $attributes| {

        if !$attributes['password_change'] {
          # fail("User ${user} has a password last changed date in the future. Please investigate.")
          notify { "plcd ${user}":
            message  => 'Not in compliance with CIS 5.4.1.5 (Scored). We believe the user has a password last changed date in the future. Please investigate.', #lint:ignore:140chars
            loglevel => 'warning',
          }
        }
      }
    }
  }
}
