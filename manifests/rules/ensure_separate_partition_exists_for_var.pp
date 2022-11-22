# @api private
#
# @summary Ensure separate partition exists for /var 
#
class secure_linux_cis::rules::ensure_separate_partition_exists_for_var {
  unless $facts['mountpoints']['/var'] {
    notify { 'vp':
      message  => 'Not in compliance with CIS  (Scored). A seperate partition does not exist for /var',
      loglevel => 'warning',
    }
  }
}
