# 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)
#
#
# Description:
# The /etc/crontab file is used by cron to control its own jobs. The commands in
# this item make sure that root is the user and group owner of the file and that
# only the owner can access the file.
#
# Rationale:
# This file contains information on what system jobs are run by cron. Write access
# to these files could provide unprivileged users with the ability to elevate
# their privileges. Read access to these files could provide users with the
# ability to gain insight on system jobs that run on the system and could provide
# them a way to gain unauthorized privileged access.
#
# @summary 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_1_2
class secure_linux_cis::redhat7::cis_5_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/etc/crontab':
      ensure => file,
      group  => 'root',
      owner  => 'root',
      mode   => '0600',
    }
  }
}
