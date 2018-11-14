# A description of what this class does
#
# @summary A short summary of the purpose of this class
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
          fail("User ${user} has a password last changed date in the future. Please investigate.")
        }
      }
    }
  }
}
