# @api private
#  Ensure audit logs are not automatically deleted (Scored)
#
# Description:
# The max_log_file_action setting determines how to handle the audit log file reaching the
# max file size. A value of keep_logs will rotate the logs but never delete old logs.
#
# Rationale:
# In high security contexts, the benefits of maintaining a long audit history exceed the cost of
# storing the audit history.
#
# @summary  Ensure audit logs are not automatically deleted (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_audit_logs_are_not_automatically_deleted
class secure_linux_cis::rules::ensure_audit_logs_are_not_automatically_deleted(
    Boolean $enforced = true,
) {
  require ::secure_linux_cis::rules::ensure_auditd_service_is_enabled

  if $enforced {
    file_line { 'max_log_file_action':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/auditd.conf',
      line     => 'max_log_file_action = keep_logs',
      match    => '^max_log_file_action',
    }
  }
}
