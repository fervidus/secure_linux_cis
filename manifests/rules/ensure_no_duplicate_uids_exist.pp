# @api private
#
# @summary Ensure no duplicate UIDs exist 
#
class secure_linux_cis::rules::ensure_no_duplicate_uids_exist {
  file { '/usr/share/cis_scripts/dup_uid.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/dup_uid.sh'),
  }
  unless $facts['duplicate_uid'].empty {
    notify { 'du':
      message  => 'Not in compliance with CIS 6 (Scored). There are duplicate UIDs in /etc/passwd. Check the duplicate_uid fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
