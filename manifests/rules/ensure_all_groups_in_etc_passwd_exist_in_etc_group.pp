# @api private
# 5 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
#
#
# Description:
# Over time, system administration errors and changes can lead to groups being defined in /etc/passwd but not in /etc/group
#
# @summary 5 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_all_groups_in_etc_passwd_exist_in_etc_group
class secure_linux_cis::rules::ensure_all_groups_in_etc_passwd_exist_in_etc_group(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/pwd_group_exist.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/pwd_group_exist.sh'),
    }
    unless $facts['password_group_exist'].empty {
      notify { 'pge':
        message  => 'Not in compliance with CIS 5 (Scored). There is a group(s) in /etc/passwd that does not exist in /etc/group. Check the password_group_exist fact for details', # lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
