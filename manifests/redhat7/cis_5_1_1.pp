# 5.1.1 Ensure cron daemon is enabled (Scored)
#
# Description:
# The cron daemon is used to execute batch jobs on the system.
#
# Rationale:
# While there may not be user jobs that need to be run on the system,
# the system does have maintenance jobs that may include security monitoring that
# have to run, and cron is used to execute them.
#
# @summary 5.1.1 Ensure cron daemon is enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_1_1
class secure_linux_cis::redhat7::cis_5_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    service { 'crond':
      ensure => running,
      enable => true,
    }
  }
}
