# @api private
#
# @summary Ensure separate partition exists for /var/tmp 
#
class secure_linux_cis::rules::ensure_separate_partition_exists_for_var_tmp {
  unless $facts['mountpoints']['/var/tmp'] {
    notify { 'vtp':
      message  => 'Not in compliance with CIS  (Scored). There is not a separate partition for /var/tmp',
      loglevel => 'warning',
    }
  }
}
