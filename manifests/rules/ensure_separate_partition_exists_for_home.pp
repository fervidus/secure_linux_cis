# @api private
# 3 Ensure separate partition exists for /home (Scored)
#
#
# Description:
# The /home directory is used to support disk storage needs of local users.
#
# @summary 3 Ensure separate partition exists for /home (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_separate_partition_exists_for_home
class secure_linux_cis::rules::ensure_separate_partition_exists_for_home(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['mountpoints']['/home'] {
      notify {'mh':
        message  => 'Not in compliance with CIS 3 (Scored). There is not a seperate partition for /home',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
