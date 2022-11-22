# @api private
#
# @summary Ensure no duplicate GIDs exist 
#
class secure_linux_cis::rules::ensure_no_duplicate_gids_exist {
  file { '/usr/share/cis_scripts/dup_gid.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/dup_gid.sh'),
  }
  unless $facts['duplicate_gid'].empty {
    notify { 'dg':
      message  => 'Not in compliance with CIS 7 (Scored). There are duplicate GIDs that exist in /etc/group. Check the duplicate_gid fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
