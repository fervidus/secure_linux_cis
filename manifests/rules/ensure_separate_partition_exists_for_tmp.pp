#  Ensure separate partition exists for /tmp (Scored)
#
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage by all users and some applications.
#
# @summary  Ensure separate partition exists for /tmp (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_separate_partition_exists_for_tmp
class secure_linux_cis::rules::ensure_separate_partition_exists_for_tmp (
  Boolean $enforced = true,
) {

  if $enforced {

    if ! $facts['mountpoints']['/tmp'] {
      notify { 'tmp-part':
        message  => 'Not in compliance with CIS  (Scored). There is not a seperate partition for /tmp',
        loglevel => 'warning',
      }
    }
  }
}


