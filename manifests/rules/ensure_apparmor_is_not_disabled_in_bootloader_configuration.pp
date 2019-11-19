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
#   include secure_linux_cis::ensure_apparmor_is_not_disabled_in_bootloader_configuration

class secure_linux_cis::rules::ensure_apparmor_is_not_disabled_in_bootloader_configuration {

    file_line {'no_interactive_boot':
      ensure => present,
      path   => '/etc/default/grub',
      line   => 'GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"',
      match  => '^\s*#?\s*GRUB_CMDLINE_LINUX=',
    }
  }
