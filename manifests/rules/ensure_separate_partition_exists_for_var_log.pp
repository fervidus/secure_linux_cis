# @api private
#
# @summary Ensure separate partition exists for /var/log 
#
class secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log {
  unless $facts['mountpoints']['/var/log'] {
    notify { 'vlp':
      message  => 'Not in compliance with CIS 1 (Scored). A separate partition does not exist for /var/log',
      loglevel => 'warning',
    }
  }
}
