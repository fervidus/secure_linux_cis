# @api private
# 1 Ensure separate partition exists for /var/log (Scored)
#
#
# Description:
# The /var/log directory is used by system services to store log data
#
# @summary 1 Ensure separate partition exists for /var/log (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_separate_partition_exists_for_var_log
class secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['mountpoints']['/var/log'] {
      notify { 'vlp':
        message  => 'Not in compliance with CIS 1 (Scored). A separate partition does not exist for /var/log',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
