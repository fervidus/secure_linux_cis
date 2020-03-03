# @api private
#  Ensure inactive password lock is 30 days or less (Scored)
#
# Description:
# User accounts that have been inactive for over a given period of time can be automatically disabled. It is recommended that accounts that
# are inactive for 30 days after password expiration be disabled.
#
# Rationale:
# Inactive accounts pose a threat to system security since the users are not logging in to notice failed login attempts or other anomalies.
#
# @summary  Ensure inactive password lock is 30 days or less (Scored)
#
# @param enforced Should this rule be enforced
# @param pass_inactive_days Password inactive days
#
# @example
#   include secure_linux_cis::ensure_inactive_password_lock_is_30_days_or_less
class secure_linux_cis::rules::ensure_inactive_password_lock_is_30_days_or_less(
    Boolean $enforced = true,
) {
  if $enforced {
    if $::secure_linux_cis::pass_inactive_days > 30 {
      fail('pass_inactive_days should be set to a value of 30 or less')
    }
    # Set the default inactivity period
    # The command 'useradd -D -f 30' does the same as editting
    # /etc/default/useradd directly.
    file_line {'useradd_inactive':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/default/useradd',
      line     => "INACTIVE=${::secure_linux_cis::pass_inactive_days}",
      match    => '^#?INACTIVE=',
    }
    # local_users fact may be undef
    $local_users = pick($facts['local_users'], {})
    $local_users.each |String $user, Hash $attributes| {
      if $attributes['password_expires_days'] != 'never' and $attributes['password_expires_days'] != 'password must be changed' and $attributes['password_inactive_days'] != $::secure_linux_cis::pass_inactive_days { #lint:ignore:140chars
        exec { "/usr/bin/chage --inactive ${::secure_linux_cis::pass_inactive_days} ${user}": }
      }
    }
  }
}
