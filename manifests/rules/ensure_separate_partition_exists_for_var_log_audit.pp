# @api private
# 2 Ensure separate partition exists for /var/log/audit (Scored)
#
# Description:
# The auditing daemon, auditd , stores log data in the /var/log/audit directory.
#
# @summary 2 Ensure separate partition exists for /var/log/audit (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_separate_partition_exists_for_var_log_audit
class secure_linux_cis::rules::ensure_separate_partition_exists_for_var_log_audit(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['mountpoints']['/var/log/audit'] {
      notify {'vla':
        message  => 'Not in compliance with CIS 2 (Scored). /var/log/audit is not in a seperate partition',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
