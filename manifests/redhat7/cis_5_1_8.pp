# 5.1.8 Ensure at/cron is restricted to authorized users (Scored)
#
# Description:
# Configure /etc/cron.allow and /etc/at.allow to allow specific users to use these
# services. If /etc/cron.allow or /etc/at.allow do not exist, then /etc/at.deny
# and /etc/cron.deny are checked. Any user not specifically defined in those files
# is allowed to use at and cron. By removing the files, only users in
# /etc/cron.allow and /etc/at.allow are allowed to use at and cron. Note that even
# though a given user is not listed in cron.allow , cron jobs can still be run as
# that user. The cron.allow file only controls administrative access to the
# crontab command for scheduling and modifying cron jobs.
#
# Rationale:
# On many systems, only the system administrator is authorized to schedule cron
# jobs. Using the cron.allow file to control who can run cron jobs enforces this
# policy. It is easier to manage an allow list than a deny list. In a deny list,
# you could potentially add a user ID to the system and forget to add it to the
# deny files.
#
# @summary 5.1.8 Ensure at/cron is restricted to authorized users (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_1_8
class secure_linux_cis::redhat7::cis_5_1_8 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/etc/cron.allow':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

    file { '/etc/at.allow':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

    file { '/etc/cron.deny':
      ensure => absent,
    }

    file { '/etc/at.deny':
      ensure => absent,
    }
  }
}
