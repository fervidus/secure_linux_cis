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
# @example
#   include secure_linux_cis::redhat7::cis_5_4_1_4
class secure_linux_cis::redhat7::cis_5_4_1_4 (
  Boolean $enforced = true,
  Integer $pass_inactive_days = 30,
) {

  if($facts['local_users']) {
    if $enforced {

      if $pass_inactive_days > 30 {
        fail('pass_inactive_days should be set to a value of 30 or less')
      }

        $facts['local_users'].each |String $user, Hash $attributes| {

        if !($attributes['max_days_between_password_change'].empty) {

          unless $attributes['if_never_conditional'] == 'never' {

            if $attributes['number_parser_inactive'] != $pass_inactive_days {

              exec { "/bin/chage --inactive ${pass_inactive_days} ${user}": }
            }
          }
        }
      }
    }
  }
}
