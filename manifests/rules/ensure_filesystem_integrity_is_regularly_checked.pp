# @api private
#  Ensure filesystem integrity is regularly checked (Scored)
#
#
# Description:
# Periodic checking of the filesystem integrity is needed to detect changes to the filesystem.
#
# @summary  Ensure filesystem integrity is regularly checked (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_filesystem_integrity_is_regularly_checked
class secure_linux_cis::rules::ensure_filesystem_integrity_is_regularly_checked(
    Boolean $enforced = true,
) {
  if $enforced {
    cron::job {'cron_aide':
      command => $::secure_linux_cis::aide_command,
      hour    => 5,
      minute  => 0,
    }
  }
}
