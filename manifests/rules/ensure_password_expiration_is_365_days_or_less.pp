# @api private
#  Ensure password expiration is 365 days or less (Scored)
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
# @summary  Ensure password expiration is 365 days or less (Scored)
#
# @param enforced Should this rule be enforced
# @param pass_max_days Password max days
#
# @example
#   include secure_linux_cis::ensure_password_expiration_is_365_days_or_less
class secure_linux_cis::rules::ensure_password_expiration_is_365_days_or_less(
    Boolean $enforced = true,
) {
  if $enforced {
    # validate parameter
    if $::secure_linux_cis::pass_max_days > 365 {
      fail('PASS_MAX_DAYS should be set to a value less than 365')
    }
    file_line { 'password expiration policy':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/login.defs',
      line     => "PASS_MAX_DAYS ${::secure_linux_cis::pass_max_days}",
      match    => '^#?PASS_MAX_DAYS',
    }
    # local_users fact may be undef
    $local_users = pick($facts['local_users'], {})
    $local_users.each |String $user, Hash $attributes| {
      if $attributes['password_expires_days'] != 'never' and
          $attributes['max_days_between_password_change'] != $::secure_linux_cis::pass_max_days {
        exec { "/usr/bin/chage --maxdays ${::secure_linux_cis::pass_max_days} ${user}": }
      }
    }
  }
}
