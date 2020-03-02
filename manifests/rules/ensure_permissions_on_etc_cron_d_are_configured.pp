# @api private
#  Ensure permissions on /etc/cron.d are configured (Scored)
#
# Description:
# The /etc/cron.d directory contains system cron jobs that need to run in a
# similar manner to the hourly, daily weekly and monthly jobs from /etc/crontab ,
# but require more granular control as to when they run. The files in this
# directory cannot be manipulated by the crontab command, but are instead edited
# by system administrators using a text editor. The commands below restrict
# read/write and search access to user and group root, preventing regular users
# from accessing this directory.
#
# Rationale:
# Granting write access to this directory for non-privileged users could provide
# them the means for gaining unauthorized elevated privileges. Granting read
# access to this directory could give an unprivileged user insight in how to gain
# elevated privileges or circumvent auditing controls.
#
# @summary  Ensure permissions on /etc/cron.d are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_cron_d_are_configured
class secure_linux_cis::rules::ensure_permissions_on_etc_cron_d_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/etc/cron.d':
      ensure   => directory,
      schedule => 'harden_schedule',
      group    => 'root',
      owner    => 'root',
      mode     => '0700',
    }
  }
}
