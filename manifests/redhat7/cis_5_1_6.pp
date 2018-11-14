# 5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)
#
# Description:
# The /etc/cron.monthly directory contains system cron jobs that need to run on a
# monthly basis. The files in this directory cannot be manipulated by the crontab
# command, but are instead edited by system administrators using a text editor.
# The commands below restrict read/write and search access to user and group root,
# preventing regular users from accessing this directory.
#
# Rationale:
# Granting write access to this directory for non-privileged users could provide
# them the means for gaining unauthorized elevated privileges. Granting read
# access to this directory could give an unprivileged user insight in how to gain
# elevated privileges or circumvent auditing controls.
#
# @summary 5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_1_6
class secure_linux_cis::redhat7::cis_5_1_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/etc/cron.monthly':
      ensure => directory,
      group  => 'root',
      owner  => 'root',
      mode   => '0700',
    }
  }
}
