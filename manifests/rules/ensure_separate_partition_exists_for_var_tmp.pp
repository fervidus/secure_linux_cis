# @api private
#  Ensure separate partition exists for /var/tmp (Scored)
#
#
# Description:
# The /var/tmp directory is a world-writable directory used for temporary storage by all users and some applications.
#
# @summary  Ensure separate partition exists for /var/tmp (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_separate_partition_exists_for_var_tmp
class secure_linux_cis::rules::ensure_separate_partition_exists_for_var_tmp(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['mountpoints']['/var/tmp'] {
      notify { 'vtp':
        message  => 'Not in compliance with CIS  (Scored). There is not a separate partition for /var/tmp',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
