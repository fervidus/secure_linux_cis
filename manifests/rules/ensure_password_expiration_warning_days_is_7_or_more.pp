# @api private
#  Ensure password expiration warning days is 7 or more (Scored)
#
# Description:
# The PASS_WARN_AGE parameter in /etc/login.defs allows an administrator to notify users that their password will expire in a defined
# number of days. It is recommended that the PASS_WARN_AGE parameter be set to 7 or more days.
#
# Rationale:
# Providing an advance warning that a password will be expiring gives users time to think of a secure password. Users caught unaware may
# choose a simple password or write it down where it may be discovered.
#
# @summary  Ensure password expiration warning days is 7 or more (Scored)
#
# @param enforced Should this rule be enforced
# @param pass_warn_days Password warning days
#
# @example
#   include secure_linux_cis::ensure_password_expiration_warning_days_is_7_or_more
class secure_linux_cis::rules::ensure_password_expiration_warning_days_is_7_or_more(
    Boolean $enforced = true,
) {
  if $enforced {
    if $::secure_linux_cis::pass_warn_days < 7 {
      fail('PASS_WARN_AGE should be set to a value of 7 or more')
    }
    file_line { 'password warning policy':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/login.defs',
      line     => "PASS_WARN_AGE ${::secure_linux_cis::pass_warn_days}",
      match    => '^#?PASS_WARN_AGE',
    }
    # local_users fact may be undef
    $local_users = pick($facts['local_users'], {})
    $local_users.each |String $user, Hash $attributes| {
      if $attributes['password_expires_days'] != 'never' and
          $attributes['warn_days_between_password_change'] != $::secure_linux_cis::pass_warn_days {
        exec { "/usr/bin/chage --warndays ${::secure_linux_cis::pass_warn_days} ${user}": }
      }
    }
  }
}
