# 5.4.1.1 Ensure password expiration is 365 days or less (Scored)
#
# Description:
# The PASS_MAX_DAYS parameter in /etc/login.defs allows an administrator to force passwords to expire once they reach a defined age. It is
# recommended that the PASS_MAX_DAYS parameter be set to less than or equal to 365 days.
#
# Rationale:
# The window of opportunity for an attacker to leverage compromised credentials or successfully compromise credentials via an online brute
# force attack is limited by the age of the password. Therefore, reducing the maximum age of a password also reduces an attacker's window
# of opportunity.
#
# @summary 5.4.1.1 Ensure password expiration is 365 days or less (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_4_1_1
class secure_linux_cis::redhat7::cis_5_4_1_1 (
  Boolean $enforced = true,
  Integer $pass_max_days = 90,
) {

  if $enforced {

    # validate parameter
    if $pass_max_days > 365 {
      fail('PASS_MAX_DAYS should be set to a value less than 365')
    }

    else {
      file_line { 'password expiration policy':
        ensure => present,
        path   => '/etc/login.defs',
        line   => "PASS_MAX_DAYS ${pass_max_days}",
        match  => '^#?PASS_MAX_DAYS',
      }

      $facts['local_users'].each |String $user, Hash $attributes| {

        if !($attributes['max_days_between_password_change'].empty) {

          if $attributes['max_days_between_password_change'] != $pass_max_days {
            exec { "/bin/chage --maxdays ${pass_max_days} ${user}": }
          }
        }
      }
    }
  }
}
