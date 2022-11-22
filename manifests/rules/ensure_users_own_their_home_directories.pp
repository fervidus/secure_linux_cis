# @api private
#
# @summary Ensure users own their home directories 
#
class secure_linux_cis::rules::ensure_users_own_their_home_directories {
  file { '/usr/share/cis_scripts/home_dir_own.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/home_dir_own.sh'),
  }
  unless $facts['home_directory_owner'].empty {
    notify { 'hdo':
      message  => 'Not in compliance with CIS  (Scored). You have a home directory that is not owned by the matching user name. Check the home_directory_owner fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
