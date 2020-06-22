# @api private
# Ensure permissions on all logfiles are configured (Scored)

# Description:
# Log files stored in /var/log/ contain logged information from many services on the system,
# or on log hosts others as well.
#
# Rationale:
# It is important to ensure that log files have the correct permissions to ensure that sensitive
#data is archived and protected.
#
# @summary Ensure permissions on all logfiles are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_all_logfiles_are_configured
class secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/var_log_permissions.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/var_log_permissions.sh'),
    }

    # Fix permissions on all files reported by this fact as wrong.
    if $facts['var_log_permissions'] {
      $logfiles = split($facts['var_log_permissions'],'\n')
      file { $logfiles:
        schedule => 'harden_schedule',
        mode     => 'g-wx,o-rwx',  #lint:ignore:no_symbolic_file_modes
      }
    }
  }
}
