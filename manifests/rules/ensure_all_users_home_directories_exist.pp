# @api private
#  Ensure all users' home directories exist (Scored)
#
#
# Description:
# Users can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist.
#
# @summary  Ensure all users' home directories exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_all_users_home_directories_exist
class secure_linux_cis::rules::ensure_all_users_home_directories_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/home_directory.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/home_directory.sh'),
    }
    unless $facts['home_directory'].empty {
      notify { 'hdir':
        message  => 'Not in compliance with CIS (Scored). You have user(s) without a home directory. Check the home_directory fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
