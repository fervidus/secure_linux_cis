# @api private
#
# @summary Ensure permissions on all logfiles are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured (
  Boolean $enforced = true,
  Array[Stdlib::Unixpath] $exclude_logs = $secure_linux_cis::exclude_logs,
) {
  file { '/usr/share/cis_scripts/var_log_permissions.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/var_log_permissions.sh'),
  }

  # Fix permissions on all files reported by this fact as wrong.
  if $facts['var_log_permissions'] {
    $logfiles = split($facts['var_log_permissions'],'\n')

    # Remove any ignored logs from the list.
    $_logfiles = $logfiles - $exclude_logs

    file { $_logfiles:
      mode     => 'g-wx,o-rwx',  #lint:ignore:no_symbolic_file_modes
    }
  }
}
