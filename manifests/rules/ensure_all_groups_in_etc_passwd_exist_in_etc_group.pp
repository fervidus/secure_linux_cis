# @api private
#
# @summary Ensure all groups in /etc/passwd exist in /etc/group 
#
class secure_linux_cis::rules::ensure_all_groups_in_etc_passwd_exist_in_etc_group {
  file { '/usr/share/cis_scripts/pwd_group_exist.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/pwd_group_exist.sh'),
  }
  unless $facts['password_group_exist'].empty {
    notify { 'pge':
      message  => 'Not in compliance with CIS 5 (Scored). There is a group(s) in /etc/passwd that does not exist in /etc/group. Check the password_group_exist fact for details', # lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
