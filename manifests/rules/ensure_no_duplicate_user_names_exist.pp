# @api private
#
# @summary Ensure no duplicate user names exist 
#
class secure_linux_cis::rules::ensure_no_duplicate_user_names_exist {
  file { '/usr/share/cis_scripts/dup_usr.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/dup_usr.sh'),
  }
  unless $facts['duplicate_user'].empty {
    notify { 'dusr':
      message  => 'Not in compliance with CIS 8 (Scored). There is a duplicate user name(s) in /etc/passwd. Check the duplicate_user fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
