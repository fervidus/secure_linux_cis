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
class secure_linux_cis::rules::ensure_interactive_boot_is_not_enabled {
  # Set the default inactivity period
  # The command 'useradd -D -f 30' does the same as editting
  # /etc/default/useradd directly.
  file_line { 'no_interactive_boot':
    ensure => present,
    path   => '/etc/sysconfig/init',
    line   => 'PROMPT=no',
    match  => '^#?PROMPT=',
  }
}
