#  Ensure users' home directories permissions are 750 or more restrictive (Scored)
#
#
# Description:
# While the system administrator can establish secure permissions for users' home directories, the users can easily override these.
#
# @summary  Ensure users' home directories permissions are 750 or more restrictive (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_users_home_directories_permissions_are_750_or_more_restrictive

class secure_linux_cis::rules::ensure_users_home_directories_permissions_are_750_or_more_restrictive {

    file { '/usr/share/cis_scripts/home_dir_perm.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/home_dir_perm.sh'),
    }

    if !($facts['home_directory_permission'].empty) {

      notify { 'hdp':
        message  => 'Not in compliance with CIS  (Scored). One or more user directories have permissions less restrictive than 750. Check the home_directory_permission fact for details', # lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
