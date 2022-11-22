# @api private
#
# @summary Ensure no world writable files exist 
#
class secure_linux_cis::rules::ensure_no_world_writable_files_exist {
  file { '/usr/share/cis_scripts/ensure_no_world_writable.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_no_world_writable.sh'),
  }
  if $facts['world_writable'] {
    notify { 'ww':
      message  => '[0] You have one or more world writable files. Check the world_writable fact for details.',
      loglevel => 'warning',
    }
  }
}
