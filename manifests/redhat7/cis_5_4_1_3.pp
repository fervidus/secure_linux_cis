# 5.4.1.3 Ensure password expiration warning days is 7 or more (Scored)
#
# Description:
# The PASS_WARN_AGE parameter in /etc/login.defs allows an administrator to notify users that their password will expire in a defined
# number of days. It is recommended that the PASS_WARN_AGE parameter be set to 7 or more days.
#
# Rationale:
# Providing an advance warning that a password will be expiring gives users time to think of a secure password. Users caught unaware may
# choose a simple password or write it down where it may be discovered.
#
# @summary 5.4.1.3 Ensure password expiration warning days is 7 or more (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_4_1_3
class secure_linux_cis::redhat7::cis_5_4_1_3 (
  Boolean $enforced = true,
  Integer $pass_warn_days = 7,
) {

  if $enforced {

    if $pass_warn_days < 7 {
      fail('PASS_WARN_AGE should be set to a value of 7 or more')
    }

    else {
      file_line { 'password warning policy':
        ensure => present,
        path   => '/etc/login.defs',
        line   => "PASS_WARN_AGE ${pass_warn_days}",
        match  => '^#?PASS_WARN_AGE',
      }

      if !($facts['local_users'].empty) {

        $facts['local_users'].each |String $user, Hash $attributes| {

          if $attributes['warn_days_between_password_change'] != $pass_warn_days {
            exec { "/bin/chage --warndays ${pass_warn_days} ${user}": }
          }
        }
      }
    }
  }
}
