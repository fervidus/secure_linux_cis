# @api private
#
# @summary Ensure no ungrouped files or directories exist 
#
class secure_linux_cis::rules::ensure_no_ungrouped_files_or_directories_exist {
  file { '/usr/share/cis_scripts/ensure_no_ungrouped.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_no_ungrouped.sh'),
  }
  if $facts['unowned_group_files'] {
    notify { 'gf':
      message  => '[2] You have files or directories that are not owned by a group. Check the unowned_group_files fact for details.',
      loglevel => 'warning',
    }
  }
}
