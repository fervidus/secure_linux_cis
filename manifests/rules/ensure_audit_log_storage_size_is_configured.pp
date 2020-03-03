# @api private
#  Ensure audit log storage size is configured (Not Scored)
#
# Description:
# Configure the maximum size of the audit log file. Once the log reaches the maximum size, it
# will be rotated and a new log file will be started.
#
# Rationale:
# It is important that an appropriate size is determined for log files so that they do not impact
# the system and audit data is not lost.
#
# @summary  Ensure audit log storage size is configured (Not Scored)
#
# @param enforced Should this rule be enforced
# @param max_log_file The maximum size of the audit log file (MB) for your organization's policy.
#
# @example
#   include secure_linux_cis::ensure_audit_log_storage_size_is_configured
class secure_linux_cis::rules::ensure_audit_log_storage_size_is_configured(
    Boolean $enforced = true,
) {
  require ::secure_linux_cis::rules::ensure_auditd_service_is_enabled

  if $enforced {
    file_line { 'max_log_file':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/auditd.conf',
      line     => "max_log_file = ${::secure_linux_cis::max_log_file}",
      match    => '^max_log_file =',
    }
  }
}
