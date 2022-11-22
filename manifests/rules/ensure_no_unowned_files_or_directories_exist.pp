# @api private
#
# @summary Ensure no unowned files or directories exist 
#
class secure_linux_cis::rules::ensure_no_unowned_files_or_directories_exist {
  file { '/usr/share/cis_scripts/ensure_no_unowned.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_no_unowned.sh'),
  }
  if $facts['unowned_user_files'] {
    notify { 'uf':
      message  => '[1] You have files or directories that are not owned by a user. Check the unowned_user_files fact for details.',
      loglevel => 'warning',
    }
  }
}
