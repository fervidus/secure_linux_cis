#  Ensure cron daemon is enabled (Scored)
#
# Description:
# The cron daemon is used to execute batch jobs on the system.
#
# Rationale:
# While there may not be user jobs that need to be run on the system,
# the system does have maintenance jobs that may include security monitoring that
# have to run, and cron is used to execute them.
#
# @summary  Ensure cron daemon is enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_cron_daemon_is_enabled

class secure_linux_cis::rules::ensure_cron_daemon_is_enabled {

  case $facts['os']['family'] {
    'RedHat': {
      $service = 'crond'
    }
    'Debian': {
      $service = 'cron'
    }
    default: {
    }
  }

    service { $service:
      ensure => running,
      enable => true,
    }
  }
