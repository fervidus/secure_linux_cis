# @api private
#
# @summary Ensure no users have .rhosts files 
#
class secure_linux_cis::rules::ensure_no_users_have_rhosts_files {
  file { '/usr/share/cis_scripts/rhost.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/rhost.sh'),
  }
  unless $facts['rhost_files'].empty {
    notify { 'rf':
      message  => 'Not in compliance with CIS 4 (Scored). A user(s) has .rhost files in their home directory. Check the rhost_files fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
