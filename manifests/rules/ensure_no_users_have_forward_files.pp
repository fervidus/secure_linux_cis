# @api private
#
# @summary Ensure no users have .forward files 
#
class secure_linux_cis::rules::ensure_no_users_have_forward_files {
  file { '/usr/share/cis_scripts/forward.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/forward.sh'),
  }
  unless $facts['forward_files'].empty {
    notify { 'ff':
      message  => 'Not in compliance with CIS 1 (Scored). There are .forward files on the system. Check the forward_files fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
