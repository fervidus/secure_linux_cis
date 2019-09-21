# 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
#
#
# Description:
# Over time, system administration errors and changes can lead to groups being defined in /etc/passwd but not in /etc/group
#
# @summary 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_15
class secure_linux_cis::redhat7::cis_6_2_15 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/share/applications/cis_scripts/pwd_group_exist.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/pwd_group_exist.sh'),
    }

    if !($facts['password_group_exist'].empty) {

      notify { 'pge':
        message  => 'Not in compliance with CIS 6.2.15 (Scored). There is a group(s) in /etc/passwd that does not exist in /etc/group. Check the password_group_exist fact for details', # lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
