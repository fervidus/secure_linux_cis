# 5.4.1.4 Ensure inactive password lock is 30 days or less (Scored)
#
# Description:
# User accounts that have been inactive for over a given period of time can be automatically disabled. It is recommended that accounts that
# are inactive for 30 days after password expiration be disabled.
#
# Rationale:
# Inactive accounts pose a threat to system security since the users are not logging in to notice failed login attempts or other anomalies.
#
# @summary 5.4.1.4 Ensure inactive password lock is 30 days or less (Scored)
#
# @param enforced Should this rule be enforced
# @param pass_inactive_days Password inactive days
#
# @example
#   include secure_linux_cis::redhat7::cis_5_4_1_4
class secure_linux_cis::redhat7::cis_5_4_1_4 (
  Boolean $enforced = true,
  Integer $pass_inactive_days = 30,
) {

  if $enforced {

    if $pass_inactive_days > 30 {
      fail('pass_inactive_days should be set to a value of 30 or less')
    }

    # local_users fact may be undef
    $local_users = pick($facts['local_users'], {})

    $local_users.each |String $user, Hash $attributes| {

      if $attributes['password_expires_days'] != 'never' and $attributes['password_inactive_days'] != $pass_inactive_days {
        exec { "/bin/chage --inactive ${pass_inactive_days} ${user}": }
      }
    }
  }
}
