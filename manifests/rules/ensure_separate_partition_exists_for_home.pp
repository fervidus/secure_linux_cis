# @api private
#
# @summary Ensure separate partition exists for /home 
#
class secure_linux_cis::rules::ensure_separate_partition_exists_for_home {
  unless $facts['mountpoints']['/home'] {
    notify { 'mh':
      message  => 'Not in compliance with CIS 3 (Scored). There is not a seperate partition for /home',
      loglevel => 'warning',
    }
  }
}
