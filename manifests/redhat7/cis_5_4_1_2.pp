# 5.4.1.2 Ensure minimum days between password changes is 7 or more (Scored)
#
# Description:
# The PASS_MIN_DAYS parameter in /etc/login.defs allows an administrator to prevent users from changing their password until a minimum
# number of days have passed since the last time the user changed their password. It is recommended that PASS_MIN_DAYS parameter be set to
# 7 or more days.
#
# Rationale:
# By restricting the frequency of password changes, an administrator can prevent users from repeatedly changing their password in an
# attempt to circumvent password reuse controls.
#
# @summary 5.4.1.2 Ensure minimum days between password changes is 7 or more (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_4_1_2
class secure_linux_cis::redhat7::cis_5_4_1_2 (
  Boolean $enforced = true,
  Integer $pass_min_days = 7,
) {

  if $enforced {

    if $pass_min_days < 7 {
      fail('PASS_min_DAYS should be set to a value of 7 or more')
    }

    else {
      file_line { 'password change policy':
        ensure => present,
        path   => '/etc/login.defs',
        line   => "PASS_MIN_DAYS ${pass_min_days}",
        match  => '^#?PASS_MIN_DAYS',
      }

        $facts['local_users'].each |String $user, Hash $attributes| {

        if !($attributes['max_days_between_password_change'].empty) {

          if $attributes['min_days_between_password_change'] != $pass_min_days {
            exec { "/bin/chage --mindays ${pass_min_days} ${user}": }
          }
        }
      }
    }
  }
}
