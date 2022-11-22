# @api private
#
# @summary Ensure separate partition exists for /var/log/audit 
#
class secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log_audit {
  unless $facts['mountpoints']['/var/log/audit'] {
    notify { 'vla':
      message  => 'Not in compliance with CIS 2 (Scored). /var/log/audit is not in a seperate partition',
      loglevel => 'warning',
    }
  }
}
