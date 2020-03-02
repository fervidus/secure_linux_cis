# @api private
#  Ensure separate partition exists for /var (Scored)
#
#
# Description:
# The /var directory is used by daemons and other system services to temporarily store dynamic data. Some directories created by
# these processes may be world-writable.
#
# @summary  Ensure separate partition exists for /var (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_separate_partition_exists_for_var
class secure_linux_cis::rules::ensure_separate_partition_exists_for_var(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['mountpoints']['/var'] {
      notify { 'vp':
        message  => 'Not in compliance with CIS  (Scored). A seperate partition does not exist for /var',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
