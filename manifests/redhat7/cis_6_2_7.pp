# 6.2.7 Ensure all users' home directories exist (Scored)
#
#
# Description:
# Users can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist.
#
# @summary 6.2.7 Ensure all users' home directories exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_7
class secure_linux_cis::redhat7::cis_6_2_7 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/share/application/cis_scripts/home_directory.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/home_directory.sh'),
    }

    if !($facts['home_directory'].empty) {
      notify { 'hdir':
        message  => 'Not in compliance with CIS 6.2.7 (Scored). You have a user(s) that does not have a home directory. Check the home_directory fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
