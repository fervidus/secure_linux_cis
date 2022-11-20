# @api private
#  Ensure at/cron is restricted to authorized users (Scored)
#
# Description:
# If at is installed in the system, configure /etc/at.allow to allow specific users to use these services. If /etc/at.allow does not exist,
#  then /etc/at.deny is checked. Any user not specifically defined in those files is allowed to use at. By removing the file, only users
#  in /etc/at.allow are allowed to use at.
# Note: Even though a given user is not listed in at.allow, at jobs can still be run as that user. The at.allow file only controls
#  administrative access to the at command for scheduling and modifying at jobs.
#
# Rationale:
# On many systems, only the system administrator is authorized to schedule at jobs. Using the at.allow file to control who can run at jobs
#  enforces this policy. It is easier to manage an allow list than a deny list. In a deny list, you could potentially add a user ID to the
#  system and forget to add it to the deny files.
#
# @summary  Ensure at is restricted to authorized users (Scored)
#
class secure_linux_cis::rules::ensure_at_is_restricted_to_authorized_users {
  file { '/etc/at.deny':
    ensure   => absent,
  }

  file { '/etc/at.allow':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 'u-x,og-rwx',
  }
}
